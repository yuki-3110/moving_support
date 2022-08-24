class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @today = Date.today
    @user = User.find(params[:id])
    @user_moving = @user.movings.order(moving_day: :desc).first
    redirect_to user_path(current_user.id), notice: "他人のプロフィールの確認はできません" unless current_user == @user
  end
end



