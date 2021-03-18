class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_products_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def top
  end


  private
  def product_params
    params.require(:product).permit(:name, :introduction, :nontax_price, :image_id, :category_id, :is_active)
  end


end

