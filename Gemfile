source 'https://rubygems.org'

ruby "2.1.2"

gem 'rails', '4.0.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'httparty'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: nil
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-byebug'
end

group :production, :qa, :staging do
  gem 'rails_12factor'
end
