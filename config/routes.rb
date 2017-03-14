Rails.application.routes.draw do
  root  'static_pages#home'
  match '/signin',    to: 'sessions#new',    via: 'get'
  match '/signout',    to: 'sessions#destroy',    via: 'get'
  match '/signup',    to: 'users#new',    via: 'get'
  match '/registred',    to: 'static_pages#user_need_confirmed',    via: 'get'
  resources :notifications
  resources :users  do
    post :update_confirmed
    post :update_name
    post :update_email
    post :update_password
  end
  resources :sessions, only: [:new, :create, :destroy]

  # Помощь по Routes 
  # http://rusrails.ru/rails-routing
end
