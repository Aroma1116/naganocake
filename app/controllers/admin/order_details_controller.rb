class Admin::OrderDetailsController < ApplicationController

  def update
    @orderdetail = OrderDetail.find(params[:id])
    @orderdetail.update(order_detail_params)
    @order = @orderdetail.order
    @orderdetails = @order.order_details
    if @orderdetails.where(production_status: "製作中").count >= 1
      @order.order_status ="製作中"
      @order.save
    end
    if @orderdetails.count == @orderdetails.where(production_status: "製作完了").count
       @order.order_status = "配送準備中"
       @order.save
    end
    redirect_to admin_order_path(@orderdetail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
