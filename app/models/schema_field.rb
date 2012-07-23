require 'mongoid'

class SchemaField
  include Mongoid::Document

  field :id
  #field :internal_name
  #field :display_name
  field :name
  field :data_type
  field :required, :type => Boolean

  embedded_in :list

  validates :name, :presence => true

  #def name=(value)
    #self.display_name = value
    #self.internal_name = "sf_#{id}_#{value.gsub(/ /, '_').downcase}" unless self.internal_name
  #end

  #def name
    #self.display_name
  #end

end
