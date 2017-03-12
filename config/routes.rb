Rails.application.routes.draw do
  root  'static_pages#home'
  match '/signin',    to: 'static_pages#signin',    via: 'get'
  resources :notifications
  resources :users

  # Помощь по Routes 
  # http://rusrails.ru/rails-routing
end
