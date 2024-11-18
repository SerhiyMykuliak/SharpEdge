Rails.application.routes.draw do
  resources :products do 
    resources :reviews
  end 
  devise_for :users
  root 'pages#home'
end
