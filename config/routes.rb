Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # client routes
#  namespace :clients
#   get '/clients', to: 'clients#index'
#   get '/clients/check_duplicate_mail', to: 'clients#check_duplicate_mail'

  resources :clients, only: [] do
    collection do
      post :filter_clients
      post :check_duplicate_mail
    end
  end
end
