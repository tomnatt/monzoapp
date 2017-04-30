Rails.application.routes.draw do
  root 'monzo#index'
  get '/dashboard' => 'monzo#index', as: 'dashboard'

  namespace :data do
    get '/byday' => 'data#by_day', as: 'data_by_day'
  end
end
