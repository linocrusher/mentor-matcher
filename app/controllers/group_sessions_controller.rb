class GroupSessionsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create, :index] #Can only be accessed by logged in users
	def new
		@group_session = GroupSession.new
	end

	def create
  	  	@group_session = GroupSession.new(group_session_params)
  		if @group_session.save
  			render 'index'
  			redirect_to group_session_path
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
