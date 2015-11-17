Rails.application.routes.draw do

  root 'restaurants#index'

  resources :restaurants, only: [:index, :show]
  resources :users, only: [:new, :create]

end
