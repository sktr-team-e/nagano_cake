class Admins::OrdersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@orders = Order.all.page(params[:page]).per(10)
	end

	def show
		@order = Order.find(params[:id])
		@order_products = @order.order_products
	end

	def update
		@order = Order.find(params[:id])
		@order_product = OrderProduct.find(params[:id])
		@order.update(order_params)
		flash[:success] = "注文ステータスを変更しました"
		redirect_to admins_order_path(@order.id)
	end

	private
	def order_params
		params.require(:order).permit(:status)
	end

end
