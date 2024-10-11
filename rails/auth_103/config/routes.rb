
Rails.application.routes.draw do
  root to: 'home#index'

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'contracts', to: 'contracts#index'
  get 'specifications', to: 'specifications#index'
end

