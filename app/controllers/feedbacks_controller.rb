/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Feb 25, 2019  Added feedback controller/

class FeedbacksController < ApplicationController
	before_action :authenticate_user, :only => [:new, :create, :destroy, :index]

	def new
		@feedback = Feedback.new

		if params[:id] == nil
			@r = User.where.not(:id => @current_user.id)
		else
			@ru = User.find(params[:id].to_i)
		end
	end

	def create
		@feedback = Feedback.new(feedback_params)

  		if @feedback.save
  			redirect_to group_sessions_path #Should redirect to Success Prompt Page / Session create page
  		else
  			render 'new'
  		end
	end

	def destroy
		@report = Feedback.find(params[:id])
    @report.destroy

    redirect_to feedbacks_path
	end

	def index
		#@feedback = Feedback.where(:t => "Feedback")
		@report = Feedback.where(:t => "Report")
	end

	private
	def feedback_params #For strong parameters
		params.require(:feedback).permit(:sender, :recipient, :t, :content, :id)
	end
end
