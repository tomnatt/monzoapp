require 'transaction_service'

# Methods for formatting data for use with ChartJS
module ChartJSService
  def self.balance_by_day_for_scatter_graph
    balance_by_day = []

    # # Get the final balance on each day
    TransactionService.all_transactions.each do |transaction|
      date = transaction.created.strftime('%Y-%m-%d') # eg 2017-02-23
      balance = transaction.account_balance.cents / 100 # want this in pounds not pence
      balance_by_day << { x: date, y: balance }
    end

    balance_by_day
  end
end
