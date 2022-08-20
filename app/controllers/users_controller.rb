class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @today = Date.today
    # @moving = Moving.find(params[:id])
    @user = User.find(params[:id])
    @user_moving_day = User.first.movings.order(moving_day: :desc).first.moving_day
    # @user_moving_day_id = User.first.movings.order(moving_day: :desc).first.moving_day.id
  end
end

# User.first.movings
# User.first.movings.first.moving_day
# User.first.movings.pluck(:moving_day)
# User.first.movings.class

