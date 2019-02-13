/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added home controller
Eizer Feb 13, 2019  Added user expiry query and view constraints/
class HomeController < ApplicationController
  before_action :save_login_state, :only => [:index] #Prevent access to the home page if user is already logged in
  
  def index
  	@toexp = User.where('expires < ?', DateTime.now) #Get all user accounts which are already expired
  	@toexp.update( :status => nil ) #Set the status to nil
  end
  
end
