class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  include ApplicationHelper

  def authorized?(action,subject = nil)
    user.try(:site_admin?)
  end
end
