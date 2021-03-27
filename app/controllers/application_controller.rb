class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected
  
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
  devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :phone_number])
  end
  
  def after_sign_up_path_for(resource)
       customers_path(resource)
  end
  
  def after_inactive_sign_up_path_for(resource)
    　customers_path(resource)
  end
  
  
  def after_sign_in_path_for(resource)
     if resource.instance_of?(Admin)
        admins_orders_path
     elsif resource.instance_of?(Customer)
        root_path
     else
        root_path
     end
  end
  

 def after_sign_out_path_for(resource)
     if resource == :admin
        new_admin_session_path
     elsif resource == :customer
        root_path
     else
        root_path
     end
 end
end