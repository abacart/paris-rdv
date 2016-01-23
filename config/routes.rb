Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :admin, only: [:index]
  resources :cart, only: [:index] do
    collection do
      post 'add_product/:id', to: 'cart#add_product', as: 'add'
      delete 'remove_product/:id', to: 'cart#remove_product', as: 'remove'
    end
  end
  root to: 'products#index'
end
