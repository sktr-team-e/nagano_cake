class Customers::CartProductsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products.all
  end

  def update

  end

  def create
    @cart_product = CartProduct.new(params_cart_product)
    @cart_product.customer_id = current_customer.id
    @cart_products = current_customer.cart_products.all
    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_amount = cart_product.amount + @cart_product.amount
        cart_product.update_attribute(:amount, new_amount)
        @cart_product.delete
      end
    end
    @cart_product.save
    redirect_to customers_cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
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

end
