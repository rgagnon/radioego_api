# taken from http://rvm.beginrescueend.com/integration/capistrano/
set :rvm_type, :user                      # we have RVM in home dir, not system-wide install
#$:.unshift("#{ENV["HOME"]}/.rvm/lib")     # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, 'ruby-1.9.3-p194@radioego_api'   # Or whatever env you want it to run in.

set :application, "RadioEgoApi"


default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository,  "git@github.com:rgagnon/radioego_api.git"
set :scm, "git"
set :user, "rgagnon"  # The server's user for deploys
set :scm_passphrase, proc{Capistrano::CLI.password_prompt('GitHub password:')}
set :branch, "master"
ssh_options[:forward_agent] = true

role :app, "www.radioego.com"
role :web, "www.radioego.com"
role :db,  "www.radioego.com", :primary => true

#ssh_options[:verbose] = :debug
#ssh_options[:username] = 'root'
set :use_sudo, false

set :rails_env, "development"

set :user, "web"
# set :user, "webuser"
set :deploy_to, "/home/#{user}/apps/radioego_api"
default_run_options[:pty] = true

namespace(:deploy) do
  desc "Shared host restart"
  task :restart do
    # run "rake db:migrate RAILS_ENV=production"
    run "touch  #{release_path}/tmp/restart.txt"
  end
end

desc "Symlink the database config file from shared directory to current release directory."
task :symlink_database_yml do
   run "ln -nsf #{shared_path}/config/database.yml #{release_path}/config/database.yml"
   run "ln -nsf #{shared_path}/assets #{release_path}/public/assets"
   run "ln -nsf #{shared_path}/bundle #{release_path}/vendor/bundle"
end

desc "Symlink the fastcgi."
task :symlink_cgi do
#
  # run "ln -nsf #{shared_path}/files #{release_path}/public"
  # run "ln -nsf #{shared_path}/avatars #{release_path}/public"
  # run "ln -nsf /mnt/data-store/data #{release_path}/public"
  # run "ln -nsf #{shared_path}/index #{release_path}"
  # run "chmod 755 #{release_path}/public/dispatch.cgi"
  # run "chmod 755 #{release_path}/public/dispatch.fcgi"
  run "chmod 755 #{release_path}/public"

end

# lots of other code
namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install --without development test"
  end

end

before "deploy:restart", "bundle:install"

after 'deploy:update_code', 'symlink_database_yml'
after 'deploy:update_code', 'symlink_cgi'