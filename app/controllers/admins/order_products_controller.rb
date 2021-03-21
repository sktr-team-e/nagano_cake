class Admins::OrderProductsController < ApplicationController
  def update
      	@order_detail = OrderDetail.find(params[:id])
			  if @order_detail.update(order_detail_params)
			  	flash[:success] = "制作ステータスを変更しました"
			    redirect_to admins_order_path(@order_detail.order)
			  else
			    render "show"
			  end
  end

  private

  def order_detail_params
		  params.require(:order_detail).permit(:making_status)
  end
end
