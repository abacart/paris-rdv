Rails.application.routes.draw do

  devise_for :users

  resources :user_boxes, only: [:edit, :destroy] do
    post 'add_product/:product_id', to: 'user_boxes#add_product', as: 'add_product'
    delete 'remove_product/:product_id', to: 'user_boxes#remove_product', as: 'remove_product'
    collection do
      get 'new/:box_id', to: 'user_boxes#new', as: 'new'
    end
  end

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
