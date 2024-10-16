
Rails.application.routes.draw do
  root to: 'home#index'

  get 'sessions/new', to: 'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  delete 'sessions/new', to: 'sessions#destroy'

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'

  get 'contracts', to: 'contracts#index'
  get 'contract/:id', to: 'contracts#show', as: 'contract'

  get 'specifications', to: 'specifications#index'
end

