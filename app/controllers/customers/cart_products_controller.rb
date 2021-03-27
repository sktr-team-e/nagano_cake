class Customers::CartProductsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products.all
    # @total_price = cart_product.product.nontaxed_price * 1.10 * cart_product.amount.to_i.all
  end

  def update
    @cart_products = CartProduct.find(params[:id])
    @cart_products.update(params_cart_product)
    redirect_to cart_products_path
  end

  def create
    @cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
    if @cart_product
      new_amount = params[:cart_product][:amount].to_i + @cart_product.amount
      @cart_product.update_attribute(:amount, new_amount)
    else
      @cart_product = current_customer.cart_products.create(params_cart_product)
    end
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def all_destroy
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    redirect_to cart_products_path
  end

  private
  def params_cart_product
    params.require(:cart_product).permit(:amount, :product_id)
  end

end
