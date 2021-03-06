class Admins::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.save!
    redirect_to admins_product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_product_path(@product.id)
  end

  def top
  end


  private
  def product_params
    params.require(:product).permit(:name, :introduction, :nontaxed_price, :image, :category_id, :is_active)
  end


end

