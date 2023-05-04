class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  # いいねが投稿に存在するかのメソッド
  def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end
 
end
