source 'https://rubygems.org'

# Rails Application
gem 'rails', '5.0.7'

# Slim Template Engine.
gem 'slim-rails'

# SCSS
gem 'sass-rails'

# Uglifier
gem 'uglifier'

# CoffeeScript
gem 'coffee-rails'

# jquery-ujs
gem 'jquery-rails'

# Locale
gem 'rails-i18n'

# Turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# V8
gem 'therubyracer', platforms: :ruby

# OAuth
gem 'omniauth'
gem 'omniauth-slack'

# Async
gem 'eventmachine'

# Enum
gem 'inum'

# SlackClient
gem 'slack-api'

# Rack
gem 'puma'

# Environment
gem 'dotenv-rails'

group :production do
  gem 'pg'
  # gem 'rails_12factor'
end

group :development do
  gem 'web-console'
  gem 'yard'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Test engine
  gem 'rspec-rails'

  gem 'coveralls'
  gem 'sqlite3'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'rails-controller-testing'
end
