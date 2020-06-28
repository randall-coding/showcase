class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  include PortfolioItemsHelper

  def authorized?(action,subject = nil)
    require_admin
  end
end
