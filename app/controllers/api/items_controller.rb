class Api::ItemsController < ApplicationController
  respond_to :json

  def index
    @list = List.find_by(slug: params[:list_id])

    #ensures the relevant class is available for list items
    item_class = Item.get_schema_enhanced_class(@list)
    
    render :json => item_class.all.to_a
  end

  def show
    @list = List.find_by(slug: params[:list_id])
    item_class = Item.get_schema_enhanced_class(@list)
    @item = item_class.find_by(intid: params[:id])
  end

  def new
    @list = List.find_by(slug: params[:list_id])
    item_class = Item.get_schema_enhanced_class(@list)
    @item = item_class.new
  end

  def create

    @list = List.find_by(slug: params[:list_id])

    item_class = Item.get_schema_enhanced_class(@list)

    @item = @list.items.create(params[item_class.name.underscore.to_sym], item_class)
    @item.intid = @list.sequence + 1;
    @item.slug = @item.intid


    if @item.save and @item.persisted?
      @list.sequence = @list.sequence + 1
      @list.save
      redirect_to list_items_path, :notice => "Item added to list."
    else
      render :action => "new"
    end
  end

  def edit
    @list = List.find_by(slug: params[:list_id])
    item_class = Item.get_schema_enhanced_class(@list)
    @item = item_class.find_by(intid: params[:id])
  end

  def update
    @list = List.find_by(slug: params[:list_id])
    item_class = Item.get_schema_enhanced_class(@list)
    @item = item_class.find_by(intid: params[:id])

    if (@item.update_attributes(params[item_class.name.underscore.to_sym]))
      redirect_to list_items_url, :notice => "Item updated successfully"
    else
      render :action => "edit"
    end
  end

  def destroy
    @list = List.find_by(slug: params[:list_id])
    item_class = Item.get_schema_enhanced_class(@list)
    @item = item_class.find_by(intid: params[:id])
    @item.destroy
    redirect_to list_items_url, :notice => "Item deleted successfully"
  end
end
