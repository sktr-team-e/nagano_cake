class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def log
    @cart_products = current_customer.cart_products
    @order = Order.new(                                    #new演算子
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )

      # address(配送先)にresidence(現住所)の値がはいっていれば
    if params[:order][:addresses] == "residence"
      @order.postcode = current_customer.postcode
      @order.address  = current_customer.address
      @order.name     = current_customer.last_name + current_customer.first_name

      # address(配送先)にaddresses(登録済み住所)の値がはいっていれば



      # address(配送先)にnew_address(新しい住所)の値がはいっていれば
    elsif params[:order][:addresses] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address  = params[:order][:address]
      @order.name     = params[:order][:name]
      @address = "1"
    end
  end

  def create
   # カート商品の注文商品への移行(下２行)
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to customers_customers_orders_thanx_path

   # もし情報入力でnew_addressの場合Addressに保存
    if params[:order][:address] == "1"
      current_customer.address.create(address_params)
    end

   # カート商品の情報を注文商品に移動(カート機能で保存された商品を一括決済)
    @cart_producs = current_customer.cart_products
    @cart_producs.each do |cart_product|
    OrderProduct.create(
      product:  cart_product.product,
      order:    @order,
      amount: cart_product.amount,
    # including_tax_price: including_tax_price(cart_product)
    )
    end

   # 注文完了後、カート商品を空にする
    #@cart_products.destroy_all

  end

  def thanx
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:postcode, :address, :name, :total_price, :payment_method )
  end

  def address_params
    params.require(:order).permit(:postcode, :address, :name)
  end

  def to_log
    redirect_to customers_cart_product_path if params[:id] == "log"
  end
end