class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
<<<<<<< HEAD

  def set_cart_product
    @cart_product = CartProduct.find(params[:id])
  end
=======
>>>>>>> 84693197830930055df2d48e23023a656d1f7798
  
  
  protected
  
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
  devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
<<<<<<< HEAD
=======
  end

  def set_cart_product
    @cart_product = CartProduct.find(params[:id])
>>>>>>> 84693197830930055df2d48e23023a656d1f7798
  end
end
