/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added user controller
Eizer Feb 5, 2019  Added methods under controller. Also added view constraints
Eizer Mar 6, 2019, Added update method for vote calculation
Eizer Mar 15, 2019, Deleting accounts also delete feedbacks
Eizer Mar 31, 2019, Clarified attributes for banned users/

class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create] #Prevents access to the Sign Up Pages if user is already logged in.
  before_action :authenticate_user, :only => [:auth, :update_status, :destroy, :show, :update] #Can only be accessed by logged in users
  skip_before_action :verify_authenticity_token

  def show
    if params[:id] == "auth"
      @unauthlist = User.where( :status => nil )
      @authlist = User.where.not( :status => nil, :id => @current_user.id)
      render 'auth'
    else
  	  @user = User.find(params[:id]) #save the user instance inside @user
      @v = Vote.where(:target => @user.id)
      if @v.count != 0
        @user.rating = (@v.where(:value => 1).count.to_f / @v.count.to_f) * 100 #Calculate user rating
      else
        @user.rating = 0
      end
      @uv = Vote.where(:voter => @current_user.id, :target => @user.id)
      @f = Feedback.where(:recipient => @user.id, :t => "Feedback")
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    @user.rating = 0
  	if @user.save
  		redirect_to @user #Should redirect to Success Prompt Page / Session create page
  	else
  		render 'new'
  	end
  end

  def destroy
    if params[:commit] == "Authenticate" or params[:commit] == "Renew" or params[:commit] == "Unban"
        @user = User.where( :username => user_params[:username] )
        @user.update( :status => "regular" )
        /User has expired. Adds 5 months to the new lifespan starting the current day/
        if @user[0][:expires] == nil or @user[0][:expires] < DateTime.now
          @user.update( :expires => (DateTime.now + 5.months) )
        end
    else
      if params[:id] ==  "update_status" #Admin deletion
        @user = User.where(:username => params[:user][:username])
        @links = Link.where(:user_id => @user.ids)
        @links.destroy_all
        @group_sessions = GroupSession.where(:user_id => @user.ids)
        @group_sessions.destroy_all
        @sent = Feedback.where(:sender => @user.ids)
        @sent.destroy_all
        @received = Feedback.where(:recipient => @user.ids)
        @received.destroy_all
        @user.destroy_all
        redirect_to users_auth_path
      else #Self deletion
        @user = User.find(params[:id])
        @links = Link.where(:user_id => @user.id)
        @links.destroy_all
        @group_sessions = GroupSession.where(:user_id => @user.id)
        @group_sessions.destroy_all
        @sent = Feedback.where(:sender => @user.id)
        @sent.destroy_all
        @received = Feedback.where(:recipient => @user.id)
        @received.destroy_all
        @user.destroy
        /Logout/
        session[:user_id] = nil
        redirect_to home_index_path
      end
    end
  end

  def auth
    @unauthlist = User.where( :status => nil )
    @authlist = User.where.not( :status => nil, :status => "banned", :id => @current_user.id)
  end

  def update_status
    @user = User.where( :username => user_params[:username] )
    if params[:commit] == "Ban"
      @user.update( :status => "banned" )
      /Destroy all group sessions and memberships/
      @links = Link.where(:user_id => @user.ids)
      @links.destroy_all
      @group_sessions = GroupSession.where(:user_id => @user.ids)
      @group_sessions.destroy_all
    else
      @user.update( :status => "regular" )
      @user.update( :expires => (DateTime.now + 5.months) )
    end
    redirect_to users_auth_path
  end

  def update
    @user = User.find(params[:id])
    @uv = Vote.where(:voter => @current_user.id, :target => @user.id)
    if params[:value] == "1"
      puts "Upvote"
      if @uv.count == 0
        @v = Vote.new(:voter => @current_user.id, :target => @user.id, :value => 1)
        @v.save
      else
        @uv.update(:value => 1)
      end
    elsif params[:value] == "0"
      puts "Remove Vote"
      @uv.destroy_all
    elsif params[:value] == "-1"
      puts "Downvote"
      if @uv.count == 0
        @v = Vote.new(:voter => @current_user.id, :target => @user.id, :value => -1)
        @v.save
      else
        @uv.update(:value => -1)
      end
    end
    redirect_to @user
  end

  private
	def user_params #For strong parameters
		params.require(:user).permit(:username, :password, :lastname, :firstname, :mi, :address, :status, :value)
	end
end
