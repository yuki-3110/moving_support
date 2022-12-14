class Users::SessionsController < Devise::SessionsController

  def guest_sign_in
    user = User.guest
    user_moving = user.movings
    sign_in user

    if user_moving.present? 
      redirect_to user_path(user.id) 
    else
      redirect_to new_moving_path, notice: 'ゲストユーザーとしてログインしました。'
    end 
  end

  def admin_guest_sign_in
    user = User.guest_admin
    user_moving = user.movings
    sign_in user

    if user_moving.present? 
      redirect_to user_path(user.id) 
    else 
      redirect_to new_moving_path, notice: 'ゲスト管理ユーザーとしてログインしました。'
    end 
  end
end