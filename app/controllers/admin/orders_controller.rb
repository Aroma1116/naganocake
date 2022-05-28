class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders.each do |order|
      @order_details = order.order_details
    end
    @total = @order_details.inject(0) { |sum, order_detail| sum +  order_detail.quantity }
  end

  def show
    @order = Order.find(params[:id])
    @orderdetail = OrderDetail.find(params[:id])
    @order.postage = 500
    @order_items = @order.order_details
    @total = @order_items.inject(0) { |sum, order_item| sum +  order_item.subtotal_order }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to  admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :item_amount, :postage, :order_status, :method, :shipping_postal_code, :shipping_address, :shipping_name)
  end

end
