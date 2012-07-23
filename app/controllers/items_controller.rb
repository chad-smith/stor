class ItemsController < ApplicationController
  def index
    @list = List.find_by_slug(params[:listid])

    #ensures the relevant class is available for list items
    item_class = Item.get_schema_enhanced_class(@list)

  end

  def show
  end

  def new
    @list = List.find_by_slug(params[:listid])
    item_class = Item.get_schema_enhanced_class(@list)
    @item = item_class.new
  end

  def create
    
    @list = List.find_by_slug(params[:listid])

    item_class = Item.get_schema_enhanced_class(@list)

    @item = @list.items.create(params[item_class.name.underscore.to_sym], item_class)
    @item.intid = @list.sequence + 1;

    if @item.save and @item.persisted?
      @list.sequence = @list.sequence + 1
      @list.save
      redirect_to items_path, :notice => "Item added to list."
    else
      render :action => "new"
    end
  end

end
