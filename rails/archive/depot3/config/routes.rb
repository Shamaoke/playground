Rails.application.routes.draw do
  resources :line_items
  resources :carts

  # get 'admin/index', to: 'admin#index', as: :admin
  get 'admin', to: 'admin#index'

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  # get 'sessions/new'
  # post 'sessions/new', to: 'sessions#create', as: :login
  # get "sessions/create"
  # get "sessions/destroy"

  resources :users
  resources :products

  # root 'products#index'
  root 'sessions#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
