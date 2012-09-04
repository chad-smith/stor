require 'blank_fields'

class FieldAttributesController < ApplicationController
  def show
    typename = params[:id] + 'Field'
    type = Object.const_get(typename)
    @fa = type.new
    render type.name.underscore, layout: false
  end
end