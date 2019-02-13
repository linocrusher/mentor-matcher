/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added sessions controller
Eizer Feb 3, 2019  Added methods. Also added view constraints/
class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home, :logout] #Should be removed once the Session Page is created
  before_action :save_login_state, :only => [:login, :login_attempt] #Prevent access to the login page if user is already logged in

  def login
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username],params[:password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		redirect_to group_sessions_path #Should redirect to Session Page
  	else
  		#Still missing error prompt
  		render "login"	
  	end
  end

  def home
    redirect_to group_sessions_path
  end

  def logout
	  session[:user_id] = nil
	  redirect_to home_index_path
  end
end
