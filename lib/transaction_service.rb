module TransactionService
  # TODO: don't create a new one of these every time
  def self.monzo_api
    return @api if @api.present?
    @api = Mondo::Client.new(
      token: ENV['MONZO_ACCESS_TOKEN'],
      account_id: ENV['MONZO_ACCOUNT_ID'] # recommended, but optional. If not set, the client will fetch it from the API
    )

    @api
  end

  # TODO: cache this response
  def self.all_transactions
    monzo_api.transactions
  end
end
