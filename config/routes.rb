Rails.application.routes.draw do
  root  'static_pages#home'
  match '/signin',    to: 'sessions#new',    via: 'get'
  match '/signout',    to: 'sessions#destroy',    via: 'get'
  match '/signup',    to: 'users#new',    via: 'get'
  resources :notifications
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # Помощь по Routes 
  # http://rusrails.ru/rails-routing
end
