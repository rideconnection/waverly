require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Waverly
  class Application < Rails::Application
    # For Grape API
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
    
    config.middleware.use(Rack::Config) do |env|
      env['api.tilt.root'] = Rails.root.join "app", "views", "api"
    end
    

    # Use Ride Connection TZ by default
    config.time_zone = 'Pacific Time (US & Canada)'

    config.generators do |g|
      # Mute rails generators
      g.helper false
      g.assets false
      g.view_specs false
    end
  end
end
