class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :user_agent, :ip_address

  puts "\nINFO\n"

  puts "delegate source is in the #{method(:delegate).source_location}"

  puts "\nINFO END\n"

  delegate :user, to: :session, allow_nil: true
end
