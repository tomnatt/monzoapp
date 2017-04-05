require 'test_helper'
require 'chart_j_s_service'

# Test ChartJSService
class ChartJSServiceTest < MockedTest
  # Scatter graph data should be formatted like this: http://www.chartjs.org/docs/#line-chart-scatter-line-charts
  def test_balance_by_day_for_scatter_graph
    balances = ChartJSService.balance_by_day_for_scatter_graph
    assert_kind_of Array, balances
    assert_kind_of Hash, balances.first

    date = TransactionService.all_transactions.first.created.strftime('%Y-%m-%d') # eg 2017-02-23
    balance = TransactionService.all_transactions.first.account_balance.cents / 100 # want this in pounds not pence
    first_balance = { x: date, y: balance }
    assert_equal first_balance, balances.first, 'Data should be of the form { x: 2017-02-23, y: 30 }'
  end
end
