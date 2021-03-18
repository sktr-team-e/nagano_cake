class Customers::ProductsController < ApplicationController
  def top
  end

  def about
  end

  def index   #ページネート１ページに８件まで表示
    @products = Product.page(params[:page]).per(8)
  end

  def show
  end



	private
	def product_params
		parmas.require(:product).permit(:name, :introduction, :nontaxed_price, :image_id, :is_active)
	end
end
