require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ContactsRspec3Rails41
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true, #true specifies to generate a fixture for each model
        view_specs: false, #false says to skip generating view specs.
        helper_specs: false, #false skips generating specs for the helper files Rails generates with each controller.
        routing_specs: false, #false omits a spec file for your config/routes.rb file. If your application is simple,
                              #as the one in this book will be, you’re probably safe skipping these specs. As your 
                              #application grows, however, and takes on more complex routing, it’s a good idea to incorporate routing specs
        controller_specs: true, 
        request_specs: false #false skips RSpec’s defaults for adding integration-level specs in spec/requests
      g.fixture_replacement :factory_girl, dir: "spec/factories" #:factory_girl tells Rails to generate factories instead of fixtures, and to save them in the spec/factories directory.
    end
  end
end
