require 'test_helper'
require 'transaction_service'

# Test TransactionService
class TransactionServiceTest < MockedTest
  # Check we are getting a proper client object
  def test_monzo_api_object
    assert_kind_of Mondo::Client, TransactionService.monzo_api,
                   'Returning object of the wrong type'
  end

  # Check we aren't creating monzo api objects over and over
  def test_same_api_object
    assert TransactionService.monzo_api.equal?(TransactionService.monzo_api),
           'Do not want to create multiple API objects'
  end

  # Check the transactions method works
  def test_get_all_transactions
    transactions = TransactionService.all_transactions(true)
    assert transactions, 'Should not return nothing'
    refute transactions.empty?, 'There should be a transaction'
    assert_equal 2, transactions.length, 'There should be two transactions'
    assert_kind_of Mondo::Transaction, transactions.first,
                   'Response should be an array of Mondo::Transaction'
    assert_equal Money.new(-510, 'GBP'), transactions.first.amount
  end

  # Cache the transactions response
  def test_cached_transaction_list
    assert TransactionService.all_transactions.equal?(TransactionService.all_transactions),
           'Should cache the response for speed'
  end
end
