
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
  driven_by :selenium, using: :firefox, screen_size: [ 1200, 800 ]
end
