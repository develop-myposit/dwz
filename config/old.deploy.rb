require 'bundler/capistrano'

server "UB6412SRV", :web, :app, :db, primary: true
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "dwz"
set :scm, :git
set :repository,  "git://github.com/develop-myposit/dwz.git"
set :branch, "master"

# role :web, "UB6412SRV"                          # Your HTTP server, Apache/etc
# role :app, "UB6412SRV"                          # This may be the same as your `Web` server
# role :db,  "UB6412SRV", :primary => true # This is where Rails migrations will run

set :user, "dwz.com"
set :deploy_to, "/home/dwz.com/apps/#{application}"
set :use_sudo, false
set :keep_releases, 2
set :default_environment, {
   'PATH' => "/home/dwz.com/.rbenv/shims:/home/dwz.com/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
   }
set :bundle_flags, "--deployment --quiet --binstubs"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   %w[start stop restart].each do |command|
     desc "#{command} unicorn server"
     task command, roles: :app, except: {no_release: true} do
       run "/etc/init.d/unicorn_#{application} #{command}"
     end
   end
      
   task :setup_config, roles: :app do
       sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
       sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
   end
      


# manage database in cap
   namespace :db do
       
      # set up symbolic link to datatase.yml
        desc "syncs the database yml file from shared location"
        task :symlink_database_yml do
            unless File.exist?("#{release_path}/config/database.yml")
              run "touch #{release_path}/config/database.yml"
            end
            run "rm #{release_path}/config/database.yml"
            run "ln -sfn #{shared_path}/config/database.yml #{release_path}/config/database.yml"
        end
      
        desc "create production database"
        task :create do
            puts "\n\n===Creating the Production Database! ==\n\n"
            run "cd #{current_path}; rake db:create RAILS_ENV=production"
        end
      
        desc "Migrate Production Database"
        task :migrate do
             puts "\n\n=== Migrating the Production Database! ===\n\n"
             run "cd #{current_path}; rake db:migrate RAILS_ENV=production"
        end
        desc "Resets the Production Database"
        task :migrate_reset do
            puts "\n\n=== Resetting the Production Database! ===\n\n"
            run "cd #{current_path}; rake db:migrate:reset RAILS_ENV=production"
        end
        desc "Destroys Production Database"
        task :drop do
            puts "\n\n=== Destroying the Production Database! ===\n\n"
            run "cd #{current_path}; rake db:drop RAILS_ENV=production"
        end
        desc "Populates the Production Database"
        task :seed do
            puts "\n\n=== Populating the Production Database! ===\n\n"
            run "cd #{current_path}; rake db:seed RAILS_ENV=production"
        end
     end
end

after "bundle:install", "deploy:db:symlink_database_yml"
after "deploy", "deploy:cleanup"


