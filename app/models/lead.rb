# Need to remove first and last name validators. There doesn't seem to be any
# way to cleanly remove a validator after it is added. So instead take
# advantage of Ruby's open classes. The stub Lead class will keep Rails from
# autoloading the engine version. Then we read in the engine source file,
# remove the lines with the validations we want to remove, and eval it.

class Lead < ActiveRecord::Base
end

fat_free_engine = Rails::Application::Railties.engines.find { |e| e.class == FatFreeCRM::Engine }
lead_source = File.read File.join(fat_free_engine.config.root, "app", "models", "entities", "lead.rb")
lead_source = lead_source.gsub(/validates_presence_of :first_name.*/, "# removed validates_presence_of :first_name")
lead_source = lead_source.gsub(/validates_presence_of :last_name.*/, "# removed validates_presence_of :last_name")
eval lead_source

# Now override/tweak everything else

class Lead < ActiveRecord::Base
  validates_presence_of :company
  
  def full_name(format = nil)
    company
  end
  
  before_save :log_status_change
  
  has_many :lead_status_changes, :dependent => :delete_all
  
  private
    def log_status_change
      if status_changed? || assigned_to_changed?
        lead_status_changes.create! :status => status, :assigned_to => assigned_to
      end
    end  
end
