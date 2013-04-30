require 'bundler/capistrano'

set :application, "dwz"
set :repository,  "git://github.com/develop-myposit/dwz.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "UB6412SRV"                          # Your HTTP server, Apache/etc
role :app, "UB6412SRV"                          # This may be the same as your `Web` server
role :db,  "UB6412SRV", :primary => true # This is where Rails migrations will run

set :user, "dwz.com"
set :deploy_to, "/home/dwz.com/apps/#{application}"
set :use_sudo, false
set :keep_releases, 2

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
