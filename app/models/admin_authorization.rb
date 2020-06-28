class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  include ApplicationHelper

  def authorized?(action,subject = nil)
    user.site_admin?
  end
end
