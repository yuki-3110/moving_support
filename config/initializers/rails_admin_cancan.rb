require 'rails_admin/main_controller'

module RailsAdmin

  class MainController < RailsAdmin::ApplicationController
    rescue_from CanCan::AccessDenied do |exception|
      flash[:alert] = '管理者以外はこのページへアクセスできません'
      redirect_to main_app.root_path
    end
  end
end