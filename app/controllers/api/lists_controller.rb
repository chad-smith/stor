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

    # check for new fields and save
=begin
    params.schema_fields.select { |f| not @list.schema_fields.index { |f2| f.id == f2.id } }
        fieldClass = Object.const_get(params[:schema_field][:data_type] +"Field")
        mergedParams = params[:schema_field].merge params[fieldClass.name.underscore]
        @field = @list.schema_fields.create(mergedParams, fieldClass)
        @field.save
    end
=end

    
    render :json => @list
  end

  def destroy
    @list = List.find_by(slug: params[:list][:id])
    @list.destroy
    redirect_to lists_url, :notice => "List deleted successfully"
  end
end
