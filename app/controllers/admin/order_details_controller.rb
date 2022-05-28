class Admin::OrderDetailsController < ApplicationController

  def update
    @orderdetail = OrderDetail.find(params[:id])
    @orderdetail.update!(order_detail_params)
    redirect_to admin_order_path(@orderdetail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
