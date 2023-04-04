class Community < ApplicationRecord
  
  belongs_to :admin
  has_many   :community_comment
  
end
