Rails.application.routes.draw do
  get '/hello', to: 'first#hello'
  get '/hi', to: 'first#hi'

  resource :users
  resource :sessions, only: [:create, :destory]
end

