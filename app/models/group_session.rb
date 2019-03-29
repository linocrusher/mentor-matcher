/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added group session model with validations/
class GroupSession < ApplicationRecord
	validates :subject, presence: true
	validates :schedule, presence: true
	validates :venue, presence: true
	validates :topic, presence: true
	validates :schedule, :uniqueness => {:scope => :user_id} #Schedule should not match any existing sessions
	has_many :links
	has_many :users, through: :links

end
