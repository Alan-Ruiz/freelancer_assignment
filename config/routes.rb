Rails.application.routes.draw do
  devise_for :users 
  root to: "freelancers#index"
  resources :freelancers
  get 'users/:id', to: 'pages#dashboard', as: 'dashboard'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
