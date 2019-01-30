class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home, :logout] #Should be removed once the Session Page is created
  before_action :save_login_state, :only => [:login, :login_attempt] #Prevent access to the login page if user is already logged in

  def login
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username],params[:password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		redirect_to(:action => 'home') #Should redirect to Thread Page
  	else
  		#Still missing error prompt
  		render "login"	
  	end
  end

  def home #Should be removed once Thread Page is created.
  end

  def logout
	  session[:user_id] = nil
	  redirect_to home_index_path
  end
end
