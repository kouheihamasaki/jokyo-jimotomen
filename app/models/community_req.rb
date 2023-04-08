class CommunityReq < ApplicationRecord
  
  belongs_to :user
  
  enum update_status: { incomplete: 0, on_hold: 1, complete: 2 }
  
end
