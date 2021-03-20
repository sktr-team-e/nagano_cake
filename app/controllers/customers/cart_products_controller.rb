class Customers::CartProductsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart_product, only: [:update, :destroy]
  before_action :authenticate_customer!

  def index
    @cart_products = current_cart.cart_products
  end

  def update
    @cart_products.update(amount: params[:cart_product][:amount].to_i)
    flash.now[:success] = "#{@cart_product.product.name}の個数を変更しました"
    @price = nontaxed_price(@cart_product).to_s(:delimited)
    @cart_products = current_cart
    @total = total_price(@cart_products).to_s(:delimited)
    redirect_to customers_cart_products_path
  end

  def create
    @cart_product = current_customer.cart_products.new(params_cart_product)

    @update_cart_product =  CartProduct.find_by(product: @cart_product.product)
    if @update_cart_product.present? && @cart_product.valid?
        @cart_product.amount += @update_cart_product.amount
        @update_cart_product.destroy
    end

    if @cart_product.save
      flash[:notice] = "#{@cart_product.product.name}をカートに追加しました"
      redirect_to products_path
    else
      @product = Product.find(params[:cart_product][:product_id])
      @cart_product = CartProduct.new
      flash[:alert] = "個数を選択してください"
      render ("customers/products/show")
    end
  end

  def destroy
    @cart_product.destroy
    flash.now[:alert] = "#{@cart_product.product.name}を削除しました"
    @cart_products = current_cart
    @total = total_price(@cart_products).to_s(:delimited)
    respond_to do |format|
      format.html{ redirect_to customers_cart_products_path }
      format.js
    end
    redirect_to customers_cart_products_path
  end

  def all_destroy
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to customers_cart_products_path
  end

  def params_cart_product
    params.require(:cart_product).permit(:amount, :product_id)
  end

end
