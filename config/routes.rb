Rails.application.routes.draw do
  root  'static_pages#home'
  match '/signin',    to: 'users#new',    via: 'get'
  match '/signup',    to: 'users#new',    via: 'get'
  resources :notifications
  resources :users

  # Помощь по Routes 
  # http://rusrails.ru/rails-routing
end
