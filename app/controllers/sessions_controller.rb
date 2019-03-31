/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added sessions controller
Eizer Feb 3, 2019  Added methods. Also added view constraints
Eizer Feb 18, 2019 Added error prompts
Eizer Mar 31, 2019  Fixed banned user handling/

class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home, :logout] #Should be removed once the Session Page is created
  before_action :save_login_state, :only => [:login, :login_attempt] #Prevent access to the login page if user is already logged in

  def login
    $b = 0
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username],params[:password])
  	if authorized_user and authorized_user.status != "banned"
  		session[:user_id] = authorized_user.id
  		redirect_to group_sessions_path #Should redirect to Session Page
    elsif authorized_user and authorized_user.status == "banned"
      $b = 5 #User banned
      render "login"
  	else
  		#Still missing error prompt

      if User.where(:username => params[:username]).exists?
        @user = User.where(:username => params[:username])
        if @user[0][:expires] == nil
          if @user[0][:status] == "admin"
            $b = 3
          else
            $b = 1 #User pending authentication
          end
        elsif @user[0][:expires] < DateTime.now
          $b = 2 #User account expired
        else
          $b = 3 #Invalid password
        end
      else
        $b = 4 #Invalid username
      end

  		render "login"
      puts $b
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
