class UsersController < ApplicationController
  def show
	@user = User.find(params[:id]) #save the user instance inside @user
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

	if @user.save
		redirect_to @user #Should redirect to Success Prompt Page / Session create page
	else
		render 'new'
	end
  end

  private
	def user_params #For strong parameters
		params.require(:user).permit(:username, :password, :lastname, :firstname, :mi, :address, :status)
	end
end
