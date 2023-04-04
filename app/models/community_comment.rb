class CommunityComment < ApplicationRecord
  
  has_many   :community
  has_many   :user
end
