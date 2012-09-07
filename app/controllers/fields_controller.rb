class FieldsController < ApplicationController
  def index
    
  end

  def show
    
  end

  def new
    @field = SchemaField.new
  end

  def create
    @list = List.find_by(slug: params[:list_id])
    fieldClass = Object.const_get(params[:schema_field][:data_type] +"Field")
    mergedParams = params[:schema_field].merge params[fieldClass.name.underscore]
    @field = @list.schema_fields.create(mergedParams, fieldClass)

    if @field.save
      redirect_to edit_list_path(@list), :notice => "Field created successfully."
    else
      render :action => "new"
    end
  end

def destroy
    @list = List.find_by(slug: params[:list_id])
    @field = @list.schema_fields.find_by(id: params[:id])
    @field.destroy
    redirect_to edit_list_path(@list), :notice => "Field deleted successfully"
  end
end
