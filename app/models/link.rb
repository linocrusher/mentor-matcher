class Link < ApplicationRecord
  belongs_to :user
  belongs_to :group_session
end
