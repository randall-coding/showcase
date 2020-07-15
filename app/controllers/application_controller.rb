class ApplicationController < ActionController::Base

  # Active Admin access denied
  def access_denied(exception)
    render file: "#{Rails.root}/public/404.html" , status: 404
  end

 # Devise sign in redirect  
  def after_sign_in_path_for(resource)
    admin_root_path
  end
end
