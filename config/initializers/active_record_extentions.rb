module ErrorMessageExtensions
  def error_messages
    self.errors.full_messages
  end
end

ActiveRecord::Base.class_eval do
  include ErrorMessageExtensions
end
