Rails.application.routes.draw do
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root to: 'sessions#welcome'
end
