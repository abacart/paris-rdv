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
  resources :shop, only: [:index]

  resources :cart, only: [:index] do
    collection do
      post 'add_box/:id', to: 'cart#add_box', as: 'add_box'
      post 'add_product/:id', to: 'cart#add_product', as: 'add_product'
      delete 'remove_box/:id', to: 'cart#remove_box', as: 'remove_box'
      delete 'remove_product/:id', to: 'cart#remove_product', as: 'remove_product'
      patch 'update_box/:id', to: 'cart#update_box', as: 'update_box'
      patch 'increase_box_quantity/:id', to: 'cart#increase_box_quantity', as: 'increase_box_quantity'
      patch 'decrease_box_quantity/:id', to: 'cart#decrease_box_quantity', as: 'decrease_box_quantity'
      patch 'increase_product_quantity/:id', to: 'cart#increase_product_quantity', as: 'increase_product_quantity'
      patch 'decrease_product_quantity/:id', to: 'cart#decrease_product_quantity', as: 'decrease_product_quantity'

    end
  end

  root to: 'shop#index'
end
