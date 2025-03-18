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

module QuotesEditor
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

    ##
    ## When validating Rails models and the validation is unsuccessful the framework
    ## will add `<div class='field_with_errors'>` element around both the label
    ## of the invalid element and the field itself. Here's the configuration of
    ## what will be added.
    ##
    ## In order to style the element add the following to `app/assets/stylesheets/application.tailwind.css`.
    ##
    ## ````
    ## div[class='field_with_errors'] {
    ##   @apply bg-red-600
    ## }
    ## ````
    ##
    ## Details
    ##
    ## • [Configuring Rails Applications — Ruby on Rails Guides](https://guides.rubyonrails.org/configuring.html#config-action-view-field-error-proc)
    ##
    ## • [ruby on rails - field_with_error not triggering Tailwind CSS style - Stack Overflow](https://stackoverflow.com/questions/72988324/field-with-error-not-triggering-tailwind-css-style)
    ##
    config.action_view.field_error_proc = -> (tag, instance) {
      content_tag :div, tag, class: 'field_with_errors'
    }
  end
end
