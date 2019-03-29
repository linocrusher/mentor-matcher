/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added group sessions controller
Eizer Feb 3, 2019  Added methods and view constraint
Eizer Mar 15, 2019  Code Refactoring
Eizer Mar 18, 2019  Added delete method/

class GroupSessionsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create, :index, :update, :show, :destroy] #Can only be accessed by logged in users
	def new
		@group_session = GroupSession.new
	end

	def create
  	  @group_session = GroupSession.new(group_session_params)

  		if @group_session.save
        @link = Link.new(:user_id => @current_user.id, :group_session_id => @group_session.id)
        @link.save
  			redirect_to group_sessions_path
  		else
  			render 'new'
  		end
	end

  def destroy
    @gs = GroupSession.find(params[:id])
    @link = Link.where(:group_session_id => @gs.id)
    @link.destroy_all
    @gs.destroy

    redirect_to group_sessions_path
  end

	def index
    @view = params[:view]
    if @view == "user"
      @group_sessions = GroupSession.where(:user_id => @current_user.id)
    else
      @group_sessions = GroupSession.where("schedule > ?", DateTime.now)
    end
	end

	def show
    	@group_session = GroupSession.find(params[:id])
    	@members = Link.where(:group_session_id => params[:id])
    	@names = []
    	@members.each do |member|
    		puts member.user_id
    		@names.push(User.find(member.user_id))
    	end
  	end

  	def update
  		@group_session = GroupSession.find(params[:group_session][:id])
  		if params[:commit] == "Join"
  			@link = Link.new() #Create a link entry between user and group session
  			@link.update(:user_id => @current_user.id, :group_session_id => params[:group_session][:id])
  		elsif params[:commit] == "Leave"
  			@link = Link.where(:user_id => @current_user.id, :group_session_id => params[:group_session][:id])
  			@link.destroy_all
  		end
  		redirect_to group_session_path(@group_session)
  	end

	private
	def group_session_params #For strong parameters
		params.require(:group_session).permit(:subject, :schedule, :venue, :topic, :username, :group_session, :type, :user_id, :view)
	end
end
