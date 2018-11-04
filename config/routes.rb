Rails.application.routes.draw do

  root    'static_pages#home'
  
  get       '/help', to: 'static_pages#help'
  get      '/about', to: 'static_pages#about'

  get      '/login', to: 'sessions#new'
  post     '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  get     '/signup', to: 'users#new'
  post    '/signup', to: 'users#create'

  resources :users
  resources :photos, only: [:new, :create]
  resources :passwords, only: [:edit, :update]
  resources :microposts, only: [:show, :new, :create, :delete]
end
