class Data::DataController < ApplicationController
  def by_day
    mondo = Mondo::Client.new(
      token: ENV['MONZO_ACCESS_TOKEN'],
      account_id: ENV['MONZO_ACCOUNT_ID'] # recommended, but optional. If not set, the client will fetch it from the API
    )

    balance_by_day = []

    # Get the final balance on each day
    mondo.transactions.each do |transaction|
      balance = {}
      date = transaction.created.strftime("%Y-%m-%d") # eg 2017-02-23
      balance = transaction.account_balance.cents / 100 # want this in pounds not pence
      balance_by_day << { x: date, y: balance }
    end

    render json: balance_by_day
  end
end
