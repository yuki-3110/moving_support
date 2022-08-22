class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # @user = User.find(params[:id])
    @user_moving = @user.movings.order(moving_day: :desc).first
    if @user_moving.present? 
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
