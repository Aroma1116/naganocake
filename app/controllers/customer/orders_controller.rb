class Customer::OrdersController < ApplicationController
  before_action :correct_customer, only: [:new]

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum +  cart_item.subtotal }
    @order = Order.new
    if  params[:order][:address_option] == "0"
      @order = Order.new(order_params)
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name
    elsif params[:order][:address_option] == "2"
      @order = Order.new(order_params)
      @order.save
    else
      flash[:alert] = "お届け先を選んでください"
      render :new
    end
    @order.postage = 800
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item.id
        order_detail.order_id = @order.id
        order_detail.quantity = cart_item.amount
        order_detail.purchase_price = cart_item.item.price
        order_detail.save
      end
      redirect_to customer_orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :method, :shipping_postal_code, :shipping_address, :shipping_name, :item_amount)
  end

  def correct_customer
    @cart_items = CartItem.all
    unless @cart_items.exists?
      redirect_to customer_cart_items_path, alert: 'カートに商品を追加してください'
    end
  end
end
