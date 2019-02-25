/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Feb 25, 2019  Added feedback controller/

class FeedbacksController < ApplicationController
	before_action :authenticate_user, :only => [:new, :create, :destroy]

	def new
		@f = Feedback.new
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

	end

	private
	def feedback_params #For strong parameters
		params.require(:feedback).permit(:sender, :recipient, :type, :content)
	end
end