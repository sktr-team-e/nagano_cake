class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_cart_product
    @cart_product = CartProduct.find(params[:id])
  end
end
