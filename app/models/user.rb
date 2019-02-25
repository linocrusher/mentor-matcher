/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Jan 30, 2019  Added user model
Eizer Feb 2, 2019  Added validations and functions
Eizer Feb 18, 2019 Added isexpired method/

class User < ApplicationRecord
	before_create :encrypt_password
	validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
	validates :password, presence: true, length: { maximum: 128 }, confirmation: true
	validates :lastname, presence: true
	validates :firstname, presence: true
	validates :address, presence: true
	has_many :links
	has_many :group_sessions, through: :links
	has_many :reports
	has_many :users, through: :reports

	def encrypt_password
		self.salt = BCrypt::Engine.generate_salt
		self.password = BCrypt::Engine.hash_secret(password, salt)
	end

	def self.authenticate(username_input="", password_input="")

		user = User.find_by_username(username_input)

		if user && user.match_password(password_input) && user.status != nil
			return user
		else
			return false
		end
	end   

	def match_password(password_input="")
		password == BCrypt::Engine.hash_secret(password_input, salt)
	end
end