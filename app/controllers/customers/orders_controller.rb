class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def log

  end

  def create
   # カート商品の注文商品への移行(下２行)
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to customers_orders_thanx_path

   # カート商品の情報を注文商品に移動(カート機能で保存された商品を一括決済)


   # 注文完了後、カート商品を空にする
    @cart_products.destroy_all

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
end