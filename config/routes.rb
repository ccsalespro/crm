CrmMm::Application.routes.draw do
  get 'reports/summary_by_status_and_agent' => 'reports#summary_by_status_and_agent'
  get 'reports/funnel_by_status_and_agent' => 'reports#funnel_by_status_and_agent'
end
