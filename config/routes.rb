Rails.application.routes.draw do
  root 'monzo#by_day'
  get '/byday' => 'monzo#by_day', as: 'by_day'

  namespace :data do
    get '/byday' => 'data#by_day', as: 'data_by_day'
  end
end
