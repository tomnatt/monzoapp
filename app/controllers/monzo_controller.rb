class MonzoController < ApplicationController
  def index
    mondo = Mondo::Client.new(
      token: ENV['MONZO_ACCESS_TOKEN'],
      account_id: ENV['MONZO_ACCOUNT_ID'] # recommended, but optional. If not set, the client will fetch it from the API
    )

    spending = []

    mondo.transactions.each do |transaction|
      if transaction.is_load && transaction.metadata['is_topup']
        spending << SpendingWeek.new(transaction.created)
      else
        spending.last.spent += transaction.amount
      end
    end

    # last_monday = Chronic.parse('last monday')

    # # transactions_by_week = mondo.transactions
    # puts '######'
    # puts Chronic.parse('last monday')
    # puts Chronic.parse('last monday') - 7.days

    puts spending.last.spent.format

    render json: spending
  end

  class SpendingWeek
    attr_accessor :start, :spent

    def initialize(start, spent = Money.new(0, 'GBP'))
      @start = start
      @spent = spent
    end
  end
end
