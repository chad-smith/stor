require 'blank_fields'

class Api::ListsController < ApplicationController
  respond_to :json

  def show
    render :json => List.find_by(slug: params[:id])
  end

  def index
    @lists = List.all.to_a

    render :json => @lists

  end

  def create
    @list = List.new(params[:list])
    @list.slug = @list.name.to_url
    @list.save

    render :json => @list

  end

  def update
    @list = List.find_by(id: params[:list][:id])
    @list.update_attributes(params[:list])
    #rebuild the relevant dynamic class
    Item.rebuild_schema(@list)

    all_fields = params[:schema_fields] || []
      # check for items that exist on server and have been removed by client
      old_fields = @list.schema_fields.select { |f2| all_fields.index { |f| f[:id] == f2._id.to_s }.nil? }
      # check for items that exist on client and have been removed by server
      new_fields = all_fields.select { |f| @list.schema_fields.index { |f2| f[:id] == f2._id.to_s }.nil? }

      # delete removed fields first
      old_fields.each do |field|
        field.delete
      end


      new_fields.each do |field|
        fieldClass = Object.const_get(field[:data_type] +"Field")
        @field = @list.schema_fields.create(field, fieldClass)
      end

    @list.save

    render :json => @list
  end

  def destroy
    @list = List.find_by(slug: params[:list][:id])
    @list.destroy
    redirect_to lists_url, :notice => "List deleted successfully"
  end
end
