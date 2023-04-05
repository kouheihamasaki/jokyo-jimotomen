class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_tag
  has_many   :post_comment
  has_many   :favorite
  
  has_one_attached :image
  
  
 def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_jokyo-jimotomen.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
