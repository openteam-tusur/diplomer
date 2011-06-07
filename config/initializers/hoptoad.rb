HoptoadNotifier.configure do |config|
  config.api_key = configatron.hoptoad.retrieve :api_key, ENV['HOPTOAD_API_KEY']
  config.host    = 'errors.openteam.ru'
  config.port    = 80
end if Rails.env.production?
