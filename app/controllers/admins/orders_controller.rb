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
		@order.update(order_params)
		if @order.status == "入金確認"
			@order.order_products.each do |order_product|
				order_product.making_status = "製作待ち"
				order_product.save
			end
		end
		flash[:success] = "注文ステータスを変更しました"
		redirect_to admins_order_path(@order.id)
	end

	private
	def order_params
		params.require(:order).permit(:status)
	end

end
