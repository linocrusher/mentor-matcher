class GroupSessionsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create, :index] #Can only be accessed by logged in users
	def new
		@group_session = GroupSession.new
	end

	def create
  	  	@group_session = GroupSession.new(group_session_params)
  	  	if type == "PM"
  	  		@group_session.hour = @group_session.hour + 12
  	  	end
  	  	@group_session.schedule = DateTime.new(:date.year, :date.month, :date.day, :hour, :minute, 0)
  		if @group_session.save
  			render 'index'
  		else
  			render 'new'
  		end
	end

	def index
		@current
	end

	private
	def group_session_params #For strong parameters
		params.require(:group_session).permit(:subject, :date, :venue, :topic, :hour, :minute, :type)
	end
end
