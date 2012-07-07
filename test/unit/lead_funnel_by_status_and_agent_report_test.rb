require 'test_helper'

class LeadFunnelByStatusAndAgentReportTest < ActiveSupport::TestCase
  test "smoke test" do
    LeadFunnelByStatusAndAgentReport.new(Date.yesterday, Date.today)
  end
end
