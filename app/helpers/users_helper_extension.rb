UsersHelper.module_eval do

  # Do not show non-admins any other users.
  # Not necessarily the best place to wedge this in, but not too bad.
  
  def user_select_with_admin_filtering(asset, users, myself)
    if myself.admin?
      user_select_without_admin_filtering(asset, users, myself)
    else
      select(asset, :assigned_to, [[t(:myself), myself.id]], {}, { :include_blank => t(:unassigned) })
    end
  end
  
  alias_method_chain :user_select, :admin_filtering
end

