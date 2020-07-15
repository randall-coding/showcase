class ApplicationController < ActionController::Base

  def access_denied(exception)
    render file: "#{Rails.root}/public/404.html" , status: 404
  end
end
