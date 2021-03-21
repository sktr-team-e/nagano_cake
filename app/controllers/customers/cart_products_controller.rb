class Customers::CartProductsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart_product, only: [:update, :destroy]
  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products.all
  end

  def update
    @cart_products = CartProduct.find(params[:id])

  end

  def create
    @cart_products = CartProduct.new(params_cart_product)
    @cart_products.customer_id = current_customer.id
    @cart_products.save
    redirect_to customers_cart_products_path
  end

  def destroy
    @cart_products = CartProduct.find(params[:id])
    @cart_products.destroy
    redirect_to customers_cart_products_path
  end

  def all_destroy
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    redirect_to customers_cart_products_path
  end

  private
  def params_cart_product
    params.require(:cart_product).permit(:amount, :product_id)
  end

  protected
    def set_cart_product
      @cart_product = CartProduct.find(params[:id])
    end

end
