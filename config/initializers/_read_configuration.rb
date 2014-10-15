require 'configatron'

configatron.configure_from_hash YAML.load_file(Rails.root.join('config', 'config.yml'))[Rails.env] rescue nil

Airbrake.configure do |config|
  config.api_key = configatron.errors.retrieve :key
  config.host    = 'errors.openteam.ru'
  config.port    = 80
end

