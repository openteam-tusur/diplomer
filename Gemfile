source :rubygems

gem 'racc'
gem 'rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'steak'
end

group :production, :development do
  gem 'pg'
  gem "exception_notification_rails3", :require => "exception_notifier"
end

group :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'capybara'
  gem 'rr'
  gem 'faker'
  gem 'launchy'
  gem 'factory_girl_rails'
end

group :development do
  gem 'rails3-generators'
  gem 'spork', :require => false
  gem 'annotate'
end

# jQuery library
gem 'jquery-rails', :require => false

# localize
gem 'russian', :git => 'git://github.com/tacid/russian'

# GUI
gem 'compass'
gem 'formtastic'
gem 'show_for'
gem 'fancy-buttons'
gem 'render_inheritable'
gem 'will_paginate', '>= 3.0.pre2'
gem 'dynamic_form'
# states
gem 'aasm', '2.2.0'

# enumerations in models
gem 'has_enum'

# attachment
gem 'paperclip'

#navigation
gem 'simple-navigation'

# inherited_resources
gem 'inherited_resources', :git => 'git://github.com/josevalim/inherited_resources'

# authorization
gem 'devise'

# reports
gem 'mime-types', :require => 'mime/types'
gem 'tempdir', :require => 'temp_dir'

# search
gem 'has_searcher'
gem 'sunspot_rails'

