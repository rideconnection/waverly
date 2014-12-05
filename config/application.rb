require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Waverly
  class Application < Rails::Application
    config.time_zone = 'Pacific Time (US & Canada)'

    config.generators do |g|
      # Mute rails generators
      g.helper false
      g.assets false
      g.view_specs false
    end
  end
end
