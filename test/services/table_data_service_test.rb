require 'test_helper'
require 'table_data_service'

# Test TableDataService
class TableDataServiceTest < MockedTest
  def setup
    super('test/data/table_data_service_test_data.json')
    @transactions = TransactionService.all_transactions(true)
  end

  def test_data_expectations
    assert_equal 5, @transactions.length, 'There should be five transactions'
  end

  # Test data is of the form [{ week: DateTime, transactions: Money, income: Money, expenditure: Money }, ...]
  def test_transactions_by_week
    assert_equal 2, TableDataService.transactions_by_week.length, 'There should be two weeks of data'

    assert_equal Chronic.parse('2015-08-10').to_date, TableDataService.transactions_by_week.first[:week],
                 'First week should have started 2015-08-10'
    assert_equal Money.new(8268, 'GBP'), TableDataService.transactions_by_week.first[:transactions],
                 'Net change should be 8268 in the first week'
    assert_equal Money.new(-1732, 'GBP'), TableDataService.transactions_by_week.first[:expenditure],
                 'Should have spent 1732 in the first week'
    assert_equal Money.new(10_000, 'GBP'), TableDataService.transactions_by_week.first[:income],
                 'Should have added 10000 in the first week'

    assert_equal Chronic.parse('2015-08-17').to_date, TableDataService.transactions_by_week.last[:week],
                 'Second week should have started 2015-08-17'
    assert_equal Money.new(-1189, 'GBP'), TableDataService.transactions_by_week.last[:transactions],
                 'Net change should be -1189 in the second week'
    assert_equal Money.new(-1189, 'GBP'), TableDataService.transactions_by_week.last[:expenditure],
                 'Should have spent 1189 in the second week'
    assert_equal Money.new(0, 'GBP'), TableDataService.transactions_by_week.last[:income],
                 'Should have added nothing in the second week'
  end
end
