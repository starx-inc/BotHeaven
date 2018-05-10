source 'https://rubygems.org'

# Rails Application
gem 'rails', '4.2.10'

# Slim Template Engine.
gem 'slim-rails', '~> 3.0.1'

# SCSS
gem 'sass-rails', '~> 5.0'

# Uglifier
gem 'uglifier', '>= 1.3.0'

# CoffeeScript
gem 'coffee-rails', '~> 4.1.0'

# jquery-ujs
gem 'jquery-rails'

# Locale
gem 'rails-i18n'

# Turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

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

gem 'sqlite3', group: "sqlite3"

group :production do
  gem 'pg'
  # gem 'rails_12factor'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'yard'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Test engine
  gem 'rspec-rails', '~> 3.0'

  gem 'coveralls'
end

group :test do
  gem 'shoulda-matchers', '~> 2.8.0'
end
