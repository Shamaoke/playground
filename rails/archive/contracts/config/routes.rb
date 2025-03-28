
Rails.application.routes.draw do

  # root to: 'home#index'

  # get '/employees', to: 'employees#index'

  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#create'

  get '/contracts', to: 'contracts#index', as: 'contracts'
  get '/contracts/:id', to: 'contracts#show', as: 'contract'

end

