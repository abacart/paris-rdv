Rails.application.routes.draw do

  devise_for :users
  resources :products
  resources :boxes
  resources :admin, only: [:index]
  resources :items, only: [:index]
  resources :cart, only: [:index] do
    collection do
      post 'add_box/:id', to: 'cart#add_box', as: 'add_box'
      post 'add_product/:id', to: 'cart#add_product', as: 'add_product'
      delete 'remove_item/:id', to: 'cart#remove_item', as: 'remove'
    end
  end
  root to: 'products#index'
end
