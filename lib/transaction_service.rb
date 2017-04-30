# Methods for dealing with the Monzo API and arranging data
module TransactionService
  def self.monzo_api
    return @api if @api.present?
    @api = Mondo::Client.new(
      token: ENV['MONZO_ACCESS_TOKEN'],
      account_id: ENV['MONZO_ACCOUNT_ID'] # Recommended, but optional. Client can get from API
    )
  end

  def self.all_transactions(expire_transactions = false)
    return @transactions unless @transactions.blank? || expire_transactions || ENV['MONZOAPP_DISABLE_CACHE']
    @transactions = monzo_api.transactions
  end
end
