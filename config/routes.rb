Rails.application.routes.draw do
  devise_for :users 
  root to: "freelancers#index"
  resources :freelancers
  get 'users/:id', to: 'pages#dashboard', as: 'dashboard'
end
