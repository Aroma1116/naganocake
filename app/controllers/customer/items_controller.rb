class Customer::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
    @params = params[:id]
    if @params
      @genre = Genre.find(params[:id])
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
