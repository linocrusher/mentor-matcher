/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Updated routing/
Rails.application.routes.draw do
  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/login_attempt'

  post 'sessions/login_attempt'

  get 'sessions/logout'

  post 'sessions/logout'

  get 'home/index'

  post 'group_sessions/new'

  post 'users/auth'

  patch 'users/update_status'

  post 'users/update_status'

  resources :users

  resources :group_sessions

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
