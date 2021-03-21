class Customers::ProductsController < ApplicationController
  def top
    @products = Product.all
  end

  def about
  end

  def index   #ページネート１ページに８件まで表示
    @products = Product.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_products = CartProduct.new
  end



	private
	def product_params
		params.require(:product).permit(:name, :introduction, :nontaxed_price, :image_id, :is_active)
	end
end
