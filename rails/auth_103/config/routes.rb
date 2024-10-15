
Rails.application.routes.draw do
  root to: 'home#index'

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'

  get 'contracts', to: 'contracts#index'
  get 'contract/:id', to: 'contracts#show', as: 'contract'

  get 'specifications', to: 'specifications#index'
end

