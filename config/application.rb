require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Waverly
  class Application < Rails::Application
    config.time_zone = 'Pacific Time (US & Canada)'

    config.generators do |g|
      # Generate MiniTest tests (not specs) by default
      # g.test_framework :minitest, spec: true, fixture: true
      
      # Mute rails generators
      # g.helper false
      # g.assets false
      # g.view_specs false
    end
  end
end
