Rails.application.routes.draw do
  root 'products#index'
  resources :admins, :only => [:show]
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
