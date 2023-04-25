class CommunityReq < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  enum update_status: { incomplete: 0, on_hold: 1, complete: 2 }

end
