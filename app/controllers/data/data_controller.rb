require 'chart_j_s_service'

# Serve data from service objects as JSON
class Data::DataController < ApplicationController
  def by_day
    render json: ChartJSService.balance_by_day_for_scatter_graph
  end
end
