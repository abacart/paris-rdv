Rails.application.routes.draw do
  resources :products
  resources :admin, only: [:index]
  root to: 'products#index'
end
