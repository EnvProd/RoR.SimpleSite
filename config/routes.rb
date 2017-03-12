Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  resources :users

  # Прогнозирую все необходимые страницы
  # get '/admin/users' - Админка со списком всех пользователей
  # get '/admin/'

  # Помощь по Routes 
  # http://rusrails.ru/rails-routing
end
