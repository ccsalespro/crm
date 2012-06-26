HomeController.class_eval do
  private
  
  def activity_user_with_privacy
    return @current_user unless @current_user.admin
    activity_user_without_privacy
  end
  
  alias_method_chain :activity_user, :privacy
end
