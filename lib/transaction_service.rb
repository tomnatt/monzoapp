# Methods for dealing with the Monzo API and arranging data
module TransactionService
  def self.monzo_api
    return @api if @api.present?
    @api = Mondo::Client.new(
      token: ENV['MONZO_ACCESS_TOKEN'],
      account_id: ENV['MONZO_ACCOUNT_ID'] # Recommended, but optional. Client can get from API
    )
  end

  def self.all_transactions
    # TODO: maybe expire this?
    return @transactions if @transactions.present?
    @transactions = monzo_api.transactions
  end
end
