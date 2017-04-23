require 'transaction_service'

# Methods for formatting data for use in tables
module TableDataService
  def self.expenditure_by_week
    expenditure_by_week = []

    # Collect transactions by week
    TransactionService.all_transactions.each do |transaction|
      monday_before_transaction = Chronic.parse('last monday', now: transaction.created).to_date

      # If this week is already in the array add the amount, else create a new entry
      if expenditure_by_week.map { |x| x[:week] }.include?(monday_before_transaction)
        expenditure_by_week.last[:expenditure] += transaction.amount
      else
        expenditure_by_week << { week: monday_before_transaction, expenditure: transaction.amount }
      end
    end

    expenditure_by_week
  end
end
