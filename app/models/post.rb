class Post < ApplicationRecord
  belongs_to :user
  has_many   :post_tags, dependent: :destroy
  has_many   :tags, through: :post_tags, dependent: :destroy
  has_many   :post_comment, dependent: :destroy
  has_many   :favorite, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :shop_name, presence: true
  validates :image, presence: true
  validates :star, presence: true
  validates :adress, presence: true

  geocoded_by :adress
  after_validation :geocode


  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_jokyo-jimotomen.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorite.exists?(user_id: user.id)
  end

  def self.looks(word)
    @post = Post.where("title LIKE?","%#{word}%")
  end

end

