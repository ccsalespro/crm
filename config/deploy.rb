require "bundler/capistrano"

set :application, "ffcrm"
set :repository,  "https://github.com/ccsalespro/crm.git"

set :scm, :git
set :deploy_via, :remote_cache

set :use_sudo, false

set :user, "root"
set :deploy_to, "/var/www/#{application}"

role :web, "patton.jncsoftware.com"
role :app, "patton.jncsoftware.com"
role :db,  "patton.jncsoftware.com", :primary => true

# set :rake, "sudo -u ffcrm rake"

after "deploy:update_code" do
  run "cp #{shared_path}/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
 
  run "chgrp ffcrm #{release_path}/tmp"
  run "chmod g+w #{release_path}/tmp"
end

# run after database.yml is symlinked
load "deploy/assets"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
