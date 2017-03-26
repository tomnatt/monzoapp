module TransactionService
  def self.monzo_api
    return @api if @api.present?
    @api = Mondo::Client.new(
      token: ENV['MONZO_ACCESS_TOKEN'],
      account_id: ENV['MONZO_ACCOUNT_ID'] # recommended, but optional. If not set, the client will fetch it from the API
    )
  end

  def self.all_transactions
    # TODO: maybe expire this?
    return @transactions if @transactions.present?
    @transactions = monzo_api.transactions
  end
end
