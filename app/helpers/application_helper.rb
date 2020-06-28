module ApplicationHelper
  def require_admin
    raise StandardError.new("require_admin failed") unless current_user.site_admin?
  end
end
