Rails.application.routes.draw do
  resources :campers, only: [:index, :show, :create]
  resources :activities, only: [:index, :destroy]
  resources :signups, only: [:create]
  
  # get '/campers', to: 'campers#index'
end
