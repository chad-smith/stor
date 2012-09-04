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
    #raise (params[:schema_field].merge params[:has_one_field]).inspect
    @field = @list.schema_fields.create((params[:schema_field].merge params[:has_one_field]), HasOneField)

    if @field.save
      redirect_to edit_list_path(@list), :notice => "Field created successfully."
    else
      render :action => "new"
    end
  end
end
