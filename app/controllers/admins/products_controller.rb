class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save!
    redirect_to admins_products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_products_path
  end

  def top
  end


  private
  def product_params
    params.require(:product).permit(:name, :introduction, :nontaxed_price, :image, :category_id, :is_active)
  end


end

