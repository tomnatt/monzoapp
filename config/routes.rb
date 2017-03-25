Rails.application.routes.draw do
  root 'monzo#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/monzo' => 'monzo#index', as: 'monzo_home'

  get '/byday' => 'monzo#by_day', as: 'by_day'

  namespace :data do
    get '/byday' => 'data#by_day', as: 'data_by_day'
  end
end
