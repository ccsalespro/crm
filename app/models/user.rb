# Nasty hack to get auto-reloading working and alter built-in classes...

fat_free_engine = Rails::Application::Railties.engines.find { |e| e.class == FatFreeCRM::Engine }
load File.join(fat_free_engine.config.root, "app", "models", "users", "user.rb")

# Now override/tweak everything else

class User < ActiveRecord::Base
  has_one :business_address,
    :dependent => :destroy,
    :as => :addressable,
    :class_name => "Address",
    :conditions => "address_type='Business'"
  accepts_nested_attributes_for :business_address, :allow_destroy => true
end
