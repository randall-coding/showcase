module PortfolioItemsHelper
  def require_admin
    raise Exception.new("require_admin failed") unless Admin.find_by_token(session[:user_token])
  end
end
