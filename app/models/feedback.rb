/This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2018-2019.
Author: Eizer Relayson
Code History:
Eizer Feb 25, 2019  Added feedback model/
class Feedback < ApplicationRecord
  validates :sender, presence: true
  validates :recipient, presence: true
  validates :content, presence: true
end
