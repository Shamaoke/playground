
Rails.application.routes.draw do

  get 'welcome', to: 'welcome#index'

  get 'one', to: 'welcome#one'
  get 'two', to: 'welcome#two'

end

