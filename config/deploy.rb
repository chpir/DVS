# https://boxpanel.blueboxgrp.com/public/the_vault/index.php/Deploy.rb_for_mod_rails

# Your Applications "Name"
set :application, "DVS"
set :domain, "globalhealth-dev2.oit.duke.edu"


# The URL to your applications repository
set :repository,  "git@github.com:dukechp/DVS.git"
set :scm, :git
set :deploy_via, :remote_cache
set :branch, "master"
set :git_enable_submodules, 1

# The user you are using to deploy with (This user should have SSH access to your server)
set :user, "mfm11"

# We want to deploy everything under your user, and we don't want to use sudo
set :use_sudo, false

# Where to deploy your application to.
set :deploy_to, "/srv/web/globalhealth-dev2.oit.duke.edu/rails/globalhealth"


role :app, domain
role :web, domain
role :db,  domain, :primary => true


default_run_options[:pty] = true  # important for windows, ok for mac/linux

# modrails
namespace :deploy do
  task :restart do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
  
  task :start do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
  
  task :after_symlink, :roles => :app do
    run "ln -s #{deploy_to}/shared/database.yml #{deploy_to}/current/config/database.yml"
  end
end