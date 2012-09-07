require 'mongoid'
include StorTypes

class Item
  class << self
    attr_accessor :list
  end

  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :intid, :type => Integer
  field :slug
  
  belongs_to :list

  def self.get_schema_enhanced_class(list)
    class_name = "ItemClass#{list.id}"

    if Object.const_defined? class_name and Object.const_get(class_name)
      item_class = Object.const_get(class_name)
    else
      item_class = Class.new(Item)
      item_class.list = list

      for field in list.schema_fields
        type = Object.const_get(field.data_type)

        item_class.send(:field, "Field#{field.id}".to_sym, type: type)
        if (field.required?)
          item_class.send(:validates, "Field#{field.id}".to_sym, :presence => true)
        end
      end

      Object.const_set(class_name, item_class)
    end
    
    return item_class
  end

  def self.rebuild_schema(list)
    class_name = "ItemClass#{list.id}"

    Object.const_set(class_name, nil)
    self.get_schema_enhanced_class(list)

  end

  def get_field_name(attribute)
    return "#{list.schema_fields[list.schema_fields.index{|field| "Field#{field._id.to_s}" == attribute.to_s}].name}"
  end

  def to_param
    slug
  end

end
