Rails.application.routes.draw do
  root 'monzo#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/monzo' => 'monzo#index', :as => 'monzo_home'
end
