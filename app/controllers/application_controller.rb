class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
<<<<<<< HEAD
  
  protected
  
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
  devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
  end

end
=======

  protected
  
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
   devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
  end
end
>>>>>>> 49239391feb5af9ca4c3fa062aff8c053daae3f8
