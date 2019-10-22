class AdminsController < ApplicationController
  def sign_in
  end

  def create_session
    desired_admin = Admin.find_by_username(params[:username])
    unless desired_admin.authenticate(params[:password])
      flash.now[:alert] = "Nope sorry"
      redirect admin_sign_in_url
      return
    end
    desired_admin.regenerate_token
    session[:user_token] = desired_admin.token
    redirect_to portfolio_item_url
  end
end
