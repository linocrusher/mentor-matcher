class GroupSessionsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create] #Can only be accessed by logged in users
	def new
	end

	def create
  		render plain: params[:group_session].inspect
	end
end
