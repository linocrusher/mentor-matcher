Rails.application.routes.draw do
  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/login_attempt'

  post 'sessions/login_attempt'

  get 'sessions/logout'

  post 'sessions/logout'

  get 'home/index'

  resources :users

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
