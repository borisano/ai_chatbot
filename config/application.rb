require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AiChatbot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    #required in order for TurboStreams to work
    config.action_dispatch.default_protect_from_forgery = false
    config.action_dispatch.default_headers = {
      'X-Frame-Options' => 'ALLOWALL'
    }
    config.autoload_paths += Dir["#{Rails.root}/app/services/**/*.rb"]

    #config.middleware.insert_after(ActionDispatch::Executor, Turbo::Streams::ActionCable)
  end
end
