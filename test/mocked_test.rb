require 'fake_monzo'

# Base class for setting up a Monzo stub
class MockedTest < ActiveSupport::TestCase
  def setup
    stub_request(:get, 'https://api.getmondo.co.uk/transactions')
      .with(query: hash_including, # accept any query parameters, including account_id
            headers: { 'Accept' => 'application/json',
                       'User-Agent' => /mondo-ruby/ })
      .to_rack(FakeMonzo.new)
  end
end
