require 'transaction_service'

# Methods for formatting data for use in tables
module TableDataService
  def self.transactions_by_week
    transactions_by_week = []

    # Collect transactions by week
    TransactionService.all_transactions.each do |transaction|
      monday_before_transaction = last_monday(transaction.created)

      # If this week is already in the array add the amount, else create a new entry
      if transactions_by_week.map { |x| x[:week] }.include?(monday_before_transaction)
        transactions_by_week.last[:transactions] += transaction.amount
      else
        transactions_by_week << { week: monday_before_transaction, transactions: transaction.amount }
      end
    end

    transactions_by_week
  end

  def self.last_monday(transaction_date)
    return transaction_date.to_date if transaction_date.monday?
    Chronic.parse('last monday', now: transaction_date).to_date
  end
end
