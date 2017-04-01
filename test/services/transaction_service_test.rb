require 'test_helper'
require 'transaction_service'

# Test TransactionService
class TransactionServiceTest < ActiveSupport::TestCase
  def setup
    stub_request(:get, 'https://api.getmondo.co.uk/transactions')
      .with(query: hash_including(), # accept any query parameters, including account_id
            headers: { 'Accept' => 'application/json',
                       'User-Agent' => /mondo-ruby/ })
      .to_return(status: 200, body: %Q(
        {
    "transactions": [
        {
            "account_balance": 13013,
            "amount": -510,
            "created": "2015-08-22T12:20:18Z",
            "currency": "GBP",
            "description": "THE DE BEAUVOIR DELI C LONDON        GBR",
            "id": "tx_00008zIcpb1TB4yeIFXMzx",
            "merchant": "merch_00008zIcpbAKe8shBxXUtl",
            "metadata": {},
            "notes": "Salmon sandwich 🍞",
            "is_load": false,
            "settled": "2015-08-23T12:20:18Z",
            "category": "eating_out"
        },
        {
            "account_balance": 12334,
            "amount": -679,
            "created": "2015-08-23T16:15:03Z",
            "currency": "GBP",
            "description": "VUE BSL LTD            ISLINGTON     GBR",
            "id": "tx_00008zL2INM3xZ41THuRF3",
            "merchant": "merch_00008z6uFVhVBcaZzSQwCX",
            "metadata": {},
            "notes": "",
            "is_load": false,
            "settled": "2015-08-24T16:15:03Z",
            "category": "eating_out"
        }
    ]
}
), headers: {})
  end

  # Check we are getting a proper client object
  def test_monzo_api_object
    assert_kind_of Mondo::Client, TransactionService.monzo_api,
                   'Returning object of the wrong type'
  end

  # Check we aren't creating monzo api objects over and over
  def test_same_api_object
    assert_equal TransactionService.monzo_api, TransactionService.monzo_api,
                 'Do not want to create multiple API objects'
  end

  # Check the transactions method works
  def test_get_all_transactions
    transactions = TransactionService.all_transactions
    assert transactions, 'Should not return nothing'
    refute transactions.empty?, 'There should be a transaction'
    assert_equal 2, transactions.length, 'There should be two transactions'
    assert_kind_of Mondo::Transaction, transactions.first,
                   'Response should be an array of Mondo::Transaction'
    assert_equal Money.new(-510, "GBP"), transactions.first.amount
  end

  # Cache the transactions response
  def test_cached_transaction_list
    assert_equal TransactionService.all_transactions, TransactionService.all_transactions,
                 'Should cache the response for speed'
  end
end
