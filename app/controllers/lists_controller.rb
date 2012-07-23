class ListsController < ApplicationController
  def index
    @lists = List.all.to_a
  end

  def show
    @list = List.find_by_slug(params[:listid])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])

    if @list.save
      redirect_to lists_url, :notice => "List created successfully."
    else
      render :action => "new"
    end
  end

  def edit
    @list = List.find_by_slug(params[:id])
  end

  def update
    @list = List.find_by_slug(params[:id])
    if @list.update_attributes(params[:list])

      #rebuild the relevant dynamic class
      Item.rebuild_schema(@list)
      redirect_to lists_url, :notice => "List updated successfully"
    else
      render :action => "edit"
    end
  end
end
