Rails.application.routes.draw do
  get '/hello', to: 'first#hello'
  get '/hi', to: 'first#hi'
  get '/me', to: 'users#me'
  delete '/sessions', to: 'sessions#destory'
  resource :users
  resource :sessions, only: [:create]
end

