require 'table_data_service'

# Serve the views onto the data
class MonzoController < ApplicationController
  def index
    @transactions_by_week = TableDataService.transactions_by_week
  end
end
