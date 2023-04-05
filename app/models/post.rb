class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_tag
  has_many   :post_comment
  has_many   :favorite
  
  has_one_attached :image
  
end
