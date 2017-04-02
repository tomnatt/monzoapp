require 'test_helper'

# Test Webmock configuration
class WebmockConfigTest < ActiveSupport::TestCase
  def test_http_disabled
    uri = URI('http://www.google.com')
    assert_raise(WebMock::NetConnectNotAllowedError) { Net::HTTP.get(uri) }
  end
end
