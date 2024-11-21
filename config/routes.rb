Rails.application.routes.draw do
  get 'cart', to: 'carts#show', as: 'cart'
  post 'cart/add', to: 'carts#add', as: 'cart_add'
  post 'cart/remove', to: 'carts#remove', as: 'cart_remove'
  post 'cart/remove_one', to: 'carts#remove_one', as: 'cart_remove_one'
  post 'contact', to: 'contacts#send_message', as: 'contact'

  resources :orders
  resources :products do 
    resources :reviews
  end 
  devise_for :users
  root 'pages#home'
end
