class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @today = Date.today
    @user = User.find(params[:id])
    @user_moving = @user.movings.order(moving_day: :desc).first
  end
end



