module TransactionService
  # TODO: don't create a new one of these every time
  def self.monzo_api
    Mondo::Client.new(
      token: ENV['MONZO_ACCESS_TOKEN'],
      account_id: ENV['MONZO_ACCOUNT_ID'] # recommended, but optional. If not set, the client will fetch it from the API
    )
  end

  def self.all_transactions
    monzo_api.transactions
  end
end
