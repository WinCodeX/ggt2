Rails.application.routes.draw do
  resources :businesses, only: [:new, :create, :edit, :update, :show, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resource :account, only: [:edit, :update]
  resources :packages, only: [:new, :create, :show]
  resources :agents, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :accounts do
        member do
      patch :update_profile_picture
    end
  end
  
  authenticate :user do
    patch '/users/update_profile_picture', to: 'users/registrations#update_profile_picture', as: :update_profile_picture
  end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get "dashboard", to: "dashboard#show", as: :dashboard
  
  get "login", to: "sessions#new", as: :login

  # Defines the root path route ("/")
  root "dashboard#show"
end
