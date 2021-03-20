class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def log

  end

  def create
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