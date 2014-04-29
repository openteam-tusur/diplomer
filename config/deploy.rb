require 'openteam/capistrano/recipes'

set :default_stage, :production
set :shared_children, fetch(:shared_children) + %w[config/config.yml config/sunspot.yml]

namespace :compass do
  desc "Compass assets precompile"
  task :precompile do
    run "cd #{deploy_to}/current && RAILS_ENV=production bundle exec compass compile -e production --force"
  end
end

after "deploy:create_symlink", "compass:precompile"
