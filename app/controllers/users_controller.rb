class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @today = Date.today
    @user = User.find(params[:id])
  end
end
