Rails.application.routes.draw do
  get 'demo/hello', to: 'products#hello'
  get 'demo/hi', to: 'products#hi'
  resources :products

  resources :carts
  resources :orders
  resources :items
  resources :searches
  get 'products/:id/destroy', to: 'products#destroy'
  get 'orders/:id/destroy', to: 'orders#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # delete '/products/:id', raketo: ' products#destroy'
end
