class LeadCallback < FatFreeCRM::Callback::Base
  def index_lead_sidebar_bottom(view, context = {})
    if view.current_user.admin?
      view.controller.send(:render_to_string, :partial => "report_links")
    end
  end
end