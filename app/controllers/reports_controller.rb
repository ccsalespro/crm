class ReportsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin
  
  def summary_by_status_and_agent
    @report_rows = get_summary_by_status_and_agent
  end
  
  private
    # Note there is a require_admin_user method in Admin::ApplicationController.
    # May want to use that or the equivalent once Fat Free CRM permissions are
    # more stable
    def require_admin
      redirect_to root_path unless @current_user.admin?
    end
    
    def get_summary_by_status_and_agent
      lead_statuses = Setting.lead_status
      
      unassigned_magic_number = 'ZZZZZZ Unassigned'
      
      category_values = lead_statuses.map { |s| "(''#{s}'')" }.join(",\n")
      category_columns = lead_statuses.map { |s| %Q["#{s}" integer] }.join(",\n")
      
      sql = <<-END_SQL
SELECT * FROM crosstab(
 'SELECT
    COALESCE(u.last_name || '', '' || u.first_name || '' ('' || u.username || '')'', u.username, ''#{unassigned_magic_number}'') AS agent,
    status,
    count(*)
  FROM leads l
    LEFT JOIN users u ON l.assigned_to=u.id
  WHERE l.deleted_at IS NULL
  GROUP BY agent, status
  ORDER BY 1, 2',
 'SELECT *
  FROM (VALUES
    #{category_values}
  ) m(text)'
) AS (
  "Agent" text,
  #{category_columns}
)
UNION ALL
SELECT * FROM crosstab(
 'SELECT
    ''Total'',
    status,
    count(*)
  FROM leads l
  WHERE l.deleted_at IS NULL
  GROUP BY status
  ORDER BY 1, 2',
 'SELECT *
  FROM (VALUES
    #{category_values}
  ) m(text)'
) AS (
  "Agent" text,
  #{category_columns}
)
      END_SQL
      
      rows = ActiveRecord::Base.connection.select_rows sql
      
      # If there are unassigned leads, we have forced them to the second to last row
      # Check if it is the magic number then fix the name
      rows[-2][0] = "* Unassigned" if rows[-2][0] == unassigned_magic_number
      
      rows
    end
end
