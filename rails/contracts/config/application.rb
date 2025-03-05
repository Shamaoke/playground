require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Contracts
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    # config.action_policy.auto_inject_into_controller = false

    ##
    ## By default, the `current_user` method will be used to assign the default
    ## authorization subject, — `user`. To prevent this behaviour we should use
    ## the following method.
    ##
    config.action_policy.controller_authorize_current_user = false
  end
end

##
## An authorization subject is configured in *two places*: in the policy class
## (through the `authorize` method) and in the controller class where we perform
## authorization (through another method with the same name — `authorize`).
##
## To prevent the default authorization subject, — `user`, to be used in policy
## classes, we should use the following method.
##
ActionPolicy::Base.authorization_targets.delete(:user)

