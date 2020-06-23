Rails.application.routes.draw do
  get 'show/productList'
  resources :e_shops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
