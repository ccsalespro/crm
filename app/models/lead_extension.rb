Lead.class_eval do
  validates_presence_of :company
  
  def full_name(format = nil)
    company
  end
  
  before_update :log_status_change
  after_create :log_initial_status
  
  has_many :lead_status_changes, :dependent => :delete_all

  def convert
    update_attribute(:status, "Closed Yes")
  end  
  
  private
    def log_status_change
      if status_changed? || assigned_to_changed?
        lead_status_changes.create! :status => status, :assigned_to => assigned_to
      end
    end  
    
    def log_initial_status
      lead_status_changes.create! :status => status, :assigned_to => assigned_to
    end
end
