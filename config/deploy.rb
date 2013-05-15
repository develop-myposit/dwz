require 'bundler/capistrano'
require 'cap-ssh-key-man/tasks/rsync'

server "UB6412SRV", :web, :app, :db, primary: true
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "dwz"
set :scm, :git
set :repository,  "git://github.com/develop-myposit/dwz.git"
set :branch, "master"

set :user, "dwz"
set :deploy_to, "/home/dwz/apps/#{application}"
set :use_sudo, false
set :keep_releases, 2
set :default_environment, {
   'PATH' => "/home/dwz/.rbenv/shims:/home/dwz.com/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
   }
set :bundle_flags, "--deployment --quiet --binstubs"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end