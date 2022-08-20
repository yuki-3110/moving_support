class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_admin!, if: :admin_url 


  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  # def admin_url
  #   request.fullpath.include?("/admin")
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
