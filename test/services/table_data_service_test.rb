require 'test_helper'
require 'table_data_service'

# Test TableDataService
class TableDataServiceTest < MockedTest
  def setup
    super('test/data/table_data_service_test_data.json')
    @transactions = TransactionService.all_transactions(true)
  end

  def test_data_expectations
    assert_equal 4, @transactions.length, 'There should be four transactions'
  end

  # Test we are getting data of the form [{ week: DateTime, expenditure: Money }, ...]
  def test_expenditure_by_week
    assert_equal 2, TableDataService.expenditure_by_week.length, 'There should be two weeks of data'

    assert_equal Chronic.parse('2015-08-10').to_date, TableDataService.expenditure_by_week.first[:week],
                 'First week should have started 2015-08-10'
    assert_equal Money.new(-1732, 'GBP'), TableDataService.expenditure_by_week.first[:expenditure],
                 'Should have spent 1732 in the first week'

    assert_equal Chronic.parse('2015-08-17').to_date, TableDataService.expenditure_by_week.last[:week],
                 'Second week should have started 2015-08-17'
    assert_equal Money.new(-1189, 'GBP'), TableDataService.expenditure_by_week.last[:expenditure],
                 'Should have spent 1189 in the second week'
  end
end
