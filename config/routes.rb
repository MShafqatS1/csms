Rails.application.routes.draw do
  
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'main#index'

  resources :users
  resources :appointments

  resources 'customers'
  resources 'technicians'

  resource 'session', only: [:create]
  get 'login', to: 'sessions#new', as: 'login'
  get "logout" => "sessions#destroy"

end