class GroupSession < ApplicationRecord
	validates :subject, presence: true
	validates :schedule, presence: true
	validates :venue, presence: true
	validates :topic, presence: true
end
