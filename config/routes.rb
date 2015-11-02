Rails.application.routes.draw do
  get 'chats/index'

  # get 'chats/new'

  # get 'chats/create', to:'chats#index'
  resources :chats
end
