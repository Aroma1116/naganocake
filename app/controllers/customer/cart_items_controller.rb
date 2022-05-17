class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: cart_item_params[:item_id])
    byebug
    if cart_item
      new_quantity = cart_item.amount + @cart_item.amount
      cart_item.update_attribute(:amount, new_quantity)
      @cart_item.delete
      redirect_to customer_cart_items_path
    else
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to customer_cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customer_cart_items_path
  end

  def destroy_all
    @cart_item = CartItem.all
    @cart_item.destroy_all
    redirect_to customer_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
