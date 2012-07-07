class ReportsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin
  
  def summary_by_status_and_agent
    @report = LeadSummaryByStatusAndAgentReport.new
  end
  
  private
    # Note there is a require_admin_user method in Admin::ApplicationController.
    # May want to use that or the equivalent once Fat Free CRM permissions are
    # more stable
    def require_admin
      redirect_to root_path unless @current_user.admin?
    end
end
