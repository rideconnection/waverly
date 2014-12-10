ruby '2.1.4'
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

group :staging, :production do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby
end

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster
gem 'turbolinks'

# Use Twitter Bootstrap framework
gem 'bootstrap-sass', '~> 3.3.1.0'
gem 'autoprefixer-rails'
gem 'bootstrap_form', '~> 2.2.0'

# Authentication and authorization
gem 'devise', '~> 3.4.1'
gem 'cancancan', '~> 1.9.2'

# Pagination
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap', '~> 1.0.1'

# API
gem 'grape', '~> 0.9.0'
gem 'grape-rabl', '~> 0.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end

group :development, :test do
  # Debugging for Ruby 2
  gem 'byebug'

  # Rails application preloader
  gem 'spring'  
end

group :development do
  # Generate layout files for various front-end frameworks (i.e. Bootstrap)
  gem 'rails_layout'

  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.3'
  gem 'capistrano-rvm', '~> 0.1.2', require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-passenger', '~> 0.0.1', require: false
  gem 'capistrano-secrets-yml', '~> 1.0.0', require: false
end

group :test do
  # Shoulda matchers and contexts for Test::Unit
  gem 'shoulda', '~> 3.5.0'
  
  # Adds Capybara feature tests in Minitest and Rails
  # gem 'minitest-rails-capybara', '~> 2.1.1'
end
