source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # gem "rspec-rails", "~> 3.9"
  gem 'factory_bot_rails', '~> 5.1'
  gem 'faker', '~> 2.10'
  gem 'rspec-rails', '4.0.0.beta3'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # TDD
  gem 'database_cleaner', '~> 1.8'
  gem 'database_cleaner-active_record', '~> 1.8'
  gem 'rails-controller-testing', '~> 1.0'
  gem 'shoulda', '~> 2.11'
  gem 'shoulda-matchers', '~> 4.3'
end

gem 'aws-sdk-s3', require: false


gem 'aasm', '~> 5.0'
gem 'annotate', '~> 3.1'
gem 'devise', '~> 4.7'
gem 'geoip', '~> 1.6'
gem 'haml-rails', '~> 2.0'
gem 'mini_magick', '~> 4.10'
gem 'pry-rails', '~> 0.3.9'
gem 'rack-cors', '~> 1.1'
gem 'rails-i18n', '~> 6.0'
gem 'time_difference', '~> 0.5.0'
gem 'useragent', '~> 0.16.10'
gem 'will_paginate', '~> 3.3'
