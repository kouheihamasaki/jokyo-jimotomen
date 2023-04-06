class Post < ApplicationRecord
  belongs_to :user
  has_many   :post_tags, dependent: :destroy
  has_many   :tags, through: :post_tags, dependent: :destroy
  has_many   :post_comment, dependent: :destroy
  has_many   :favorite, dependent: :destroy
  
  has_one_attached :image
  
  
 def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_jokyo-jimotomen.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
 end

