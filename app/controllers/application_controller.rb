class ApplicationController < ActionController::Base
  include TasksHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.movings.present?  
      user_path(resource.id) 
    else 
      new_moving_path(resource.id) 
    end 
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
