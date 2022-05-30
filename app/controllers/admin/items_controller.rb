class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "Item"
      @records = Item.search_for(@content, @method)
      if @records.count == 0
        redirect_to admin_items_path, alert: "該当なし"
      end
    end
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
