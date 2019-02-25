class Feedback < ApplicationRecord
  validates :sender, presence: true
  validates :recipient, presence: true
  validates :content, presence: true
end
