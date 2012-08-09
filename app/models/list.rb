require 'mongoid'

class List
  include Mongoid::Document

  field :id
  field :name
  field :slug
  field :sequence, :type => Integer, :default => 0
  field :show_on_menu, type: Boolean

  embeds_many :schema_fields
  accepts_nested_attributes_for :schema_fields, :allow_destroy => true
  has_many :items

  validates :name, :presence => true

  def to_param
    slug
  end

end
