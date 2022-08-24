module UsersHelper

  def user_moving
    @user_moving = @user.movings.order(moving_day: :desc).first
  end
end
