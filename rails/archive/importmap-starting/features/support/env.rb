
require 'cucumber/rails'
require 'capybara/cuprite'

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app, headless: false, slowmo: 0.2, window_size: [1200, 800])
end

Capybara.javascript_driver = :cuprite

## Alias `Given`, `When`, `Then`, etc. keywords for defining step definitions
## to `define`
singleton_class.alias_method :define, :register_rb_step_definition

##
## By default, any exception happening in your Rails application will bubble up
## to Cucumber so that your scenario will fail. This is a different from how
## your application behaves in the production environment, where an error page will
## be rendered instead.
##
## Sometimes we want to override this default behaviour and allow Rails to rescue
## exceptions and display an error page (just like when the app is running in production).
## Typical scenarios where you want to do this is when you test your error pages.
## There are two ways to allow Rails to rescue exceptions:
##
## 1) Tag your scenario (or feature) with @allow-rescue
##
## 2) Set the value below to true. Beware that doing this globally is not
## recommended as it will mask a lot of errors for you!
##
ActionController::Base.allow_rescue = false

Capybara.configure do |config|

  config.default_driver = :rack_test
  ## :rack_test (default)
  ## :selenium
  ## :selenium_headless
  ## :selenium_chrome
  ## :selenium_chrome_headless

  config.server = :puma, { Silent: true }
end

##
## Remove/comment out the lines below if your app doesn't have a database.
## For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
##
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

##
## You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
## See the DatabaseCleaner documentation for details. Example:
##
##   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
##     # { except: [:widgets] } may not do what you expect here
##     # as Cucumber::Rails::Database.javascript_strategy overrides
##     # this setting.
##     DatabaseCleaner.strategy = :truncation
##   end
##
##   Before('not @no-txn', 'not @selenium', 'not @culerity', 'not @celerity', 'not @javascript') do
##     DatabaseCleaner.strategy = :transaction
##   end
##

## Possible values are :truncation and :transaction
## The :transaction strategy is faster, but might give you threading problems.
## See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

