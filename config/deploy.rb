require 'mongrel_cluster/recipes'

set :application, "<app_name>"
set :use_sudo, false
set :deploy_via, :remote_cache
set :mongrel_conf, "/etc/mongrel_cluster/<app_name>.conf"


set :scm, "git"
set :repository,  "git@github.com:<your_git_name>/<app_name>.git"
set :branch, "master"
default_run_options[:pty] = true


set :ssh_options, { :forward_agent => true }

set :user, "root"

role :app, "<your_deployment_destination>"
role :web, "<your_deployment_destination>"
role :db,  "<your_deployment_destination>", :primary => true

task :symlink_database_yml, :roles => :app do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config"
  run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db"
  run "ln -nfs #{shared_path}/public/attachments #{release_path}/attachments"
end

after 'deploy:update_code', 'symlink_database_yml'