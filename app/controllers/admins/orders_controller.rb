class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
		@order_products = @order.order_products
	  @customer = Customer.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_product = OrderProduct.find(params[:id])
		if @order.update(order_params)
		   flash[:success] = "注文ステータスを変更しました"
			if @order_product.update(order_product_params)
				 flash[:success2] = "製作ステータスを変更しました"
	    	redirect_to admins_order_path(@order_product.order)
	  		else
	  		render "show"
	  		end
		end
	end

  private
	def order_params
		  params.require(:order).permit(:status)
	end

	def order_product_params
			params.require(:order_product).permit(:making_status)
	end

end
