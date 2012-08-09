require 'mongoid'

class SchemaField
  include Mongoid::Document

  field :id
  field :name
  field :data_type
  field :required, :type => Boolean

  embedded_in :list

  validates :name, :presence => true

end
