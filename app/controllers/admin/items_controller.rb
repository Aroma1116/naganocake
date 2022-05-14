class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
   if @item.save
     redirect_to admin_item_path(@item)
   else
     @genres = Genre.all
     render :new
   end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :purchase_status, :item_image)
  end
end
