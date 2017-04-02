# require 'chart_j_s_service'

# Serve data from service objects as JSON
class Data::DataController < ApplicationController
  def by_day
    balance_by_day = []

    # Get the final balance on each day
    TransactionService.all_transactions.each do |transaction|
      date = transaction.created.strftime('%Y-%m-%d') # eg 2017-02-23
      balance = transaction.account_balance.cents / 100 # want this in pounds not pence
      balance_by_day << { x: date, y: balance }
    end

    render json: balance_by_day
  end
end
