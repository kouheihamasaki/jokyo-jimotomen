class CommunityComment < ApplicationRecord

  belongs_to   :community
  belongs_to   :user

  validates :comment, presence: true

end
