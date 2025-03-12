
Rails.application.routes.draw do

  get 'sample', to: 'sample#index'

  get 'one', to: 'sample#one'
  get 'two', to: 'sample#two'

end

