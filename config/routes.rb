Rails.application.routes.draw do
  get 'accounts/edit'
  get 'accounts/update'
  devise_for :users
  resource :account, only: [:edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get "dashboard", to: "dashboard#show", as: :dashboard
  
  get "login", to: "sessions#new", as: :login

  # Defines the root path route ("/")
  root "dashboard#show"
end
