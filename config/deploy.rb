require 'openteam/capistrano/recipes'

set :default_stage, :production
set :shared_children, fetch(:shared_children) + %w[config/sunspot.yml]

namespace :compass do
  desc "Compass assets precompile"
  task :precompile do
    run "cd #{deploy_to}/current && bundle exec compass compile -e production --force"
  end
end

after "deploy", "compass:precompile"
after "deploy:rollback", "compass:precompile"
