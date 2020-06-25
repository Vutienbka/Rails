Rails.application.routes.draw do
  resources :orders
  get 'store/index'
  get 'show/productList'
  get 'by/product', to: 'by#product'
  root to: 'store#index'
  resources :items
  resources :carts
  resources :e_shops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
