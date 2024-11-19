Rails.application.routes.draw do
  get 'cart', to: 'carts#show', as: 'cart'
  post 'cart/add', to: 'carts#add', as: 'cart_add'
  post 'cart/remove', to: 'carts#remove', as: 'cart_remove'

  resources :products do 
    resources :reviews
  end 
  devise_for :users
  root 'pages#home'
end
