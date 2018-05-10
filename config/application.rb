require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BotsHeaven
  class Application < Rails::Application
    # Optional auto load path
    config.paths.add 'lib', eager_load: true

    # TimeZone and Locale Setting.
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja

    config.generators do |g|
      # Use Slim for template engine.
      g.template_engine :slim

      # Use Rspec for test engine.
      g.test_framework :rspec
    end
  end
end
