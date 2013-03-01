require "bundler/capistrano"
require "rvm/capistrano"

load "config/deploy/settings"
load "config/deploy/database"
load "config/deploy/tag"

namespace :deploy do
  desc "Copy config files"
  task :config_app, :roles => :app do
    run "ln -s #{deploy_to}/shared/config/config.yml #{release_path}/config/config.yml"
    run "ln -s #{deploy_to}/shared/config/sunspot.yml #{release_path}/config/sunspot.yml"
    run "ln -s #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Copy unicorn.rb file"
  task :copy_unicorn_config do
    run "ln -s #{deploy_to}/shared/config/unicorn.rb #{deploy_to}/current/config/unicorn.rb"
  end

  desc "Reload Unicorn"
  task :reload_servers do
    sudo "/etc/init.d/#{unicorn_instance_name} restart"
  end

  desc "Sunspot solr reindex"
  task :sunspot_reindex do
    run "cd #{deploy_to}/current && RAILS_ENV=production bin/rake sunspot:reindex"
  end
end

# deploy
after "deploy:finalize_update", "deploy:config_app"
after "deploy", "deploy:migrate"
after "deploy", "deploy:copy_unicorn_config"
after "deploy", "deploy:reload_servers"
after "deploy:restart", "deploy:cleanup"

# deploy:rollback
after "deploy:rollback", "deploy:reload_servers"
