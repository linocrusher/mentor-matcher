/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added group sessions controller
Eizer Feb 3, 2019  Added methods and view constraint/
class GroupSessionsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create, :index] #Can only be accessed by logged in users
	def new
		@group_session = GroupSession.new
	end

	def create
  	  	@group_session = GroupSession.new(group_session_params)
  		if @group_session.save
  			#render 'index'
  			redirect_to group_sessions_path
  		else
  			render 'new'
  		end
	end

	def index
		@group_sessions = GroupSession.all
	end

	private
	def group_session_params #For strong parameters
		params.require(:group_session).permit(:subject, :schedule, :venue, :topic)
	end
end
