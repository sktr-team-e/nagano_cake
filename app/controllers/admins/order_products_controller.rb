class Admins::OrderProductsController < ApplicationController
	def update
		@order_product = OrderProduct.find(params[:id])
		if @order_product.update(order_product_params)
			if @order_product.making_status == "製作中"
				# @order_product.order.status = "製作中"
				@order_product.order.update(status: "製作中")

			elsif @order_product.making_status == "製作完了"
				order_products = OrderProduct.where(order_id: @order_product.order.id, making_status: "製作完了").count
				if order_products == @order_product.order.order_products.count
					@order_product.order.update(status: "発送準備中")
				end
				# @order_products.order.order_products.each do |order_product|
				# 	if order_product.making_status != "製作完了"
				# 		order_product.order.update(status: "製作中")
				# 		break
				# 	else
				# 		order_product.order.update(status: "発送準備中")
				# 	end
				# end
			end
			flash[:success] = "製作ステータスを変更しました"
			redirect_to admins_order_path(@order_product.order)
		else
			render "show"
		end
	end

  private
  def order_product_params
		  params.require(:order_product).permit(:making_status)
  end
end
