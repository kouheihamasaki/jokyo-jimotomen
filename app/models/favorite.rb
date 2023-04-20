class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  
  
  def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end
 
 
end
