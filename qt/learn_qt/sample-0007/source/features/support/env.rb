
require 'xmlrpc/client'

Cucumber::Glue::Dsl.alias_adverb('Step')

XMLRPC::Config.enable_nil_parser = true

Before do
  @application = TestApplication.new
end

After do
  @application&.stop
end

AfterStep do
  sleep(Float(ENV.fetch('STEP_DELAY', '0')))
end

