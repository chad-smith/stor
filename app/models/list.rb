require 'mongoid'

class List
  include Mongoid::Document
  include Mongoid::Slug
  
  field :id
  #field :display_name
  #field :internal_name
  field :name
  slug :name
  field :sequence, :type => Integer, :default => 0
  field :show_on_menu, type: Boolean

  #def name=(value)
    #self.display_name = value
    #self.internal_name = "l_#{id}_#{value.gsub(/ /, '_').downcase}" unless self.internal_name
  #end

  #def name
    #self.display_name
  #end

  embeds_many :schema_fields
  accepts_nested_attributes_for :schema_fields, :allow_destroy => true
  has_many :items

  validates :name, :presence => true

end
