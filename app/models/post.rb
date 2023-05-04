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

  # 画像データがなければデフォルト画像を出力する
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_jokyo-jimotomen.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  # いいねが投稿に存在するかのメソッド
  def favorited_by?(user)
    favorite.exists?(user_id: user.id)
  end

  # ワード検索機能
  def self.looks(word)
    @post = Post.where("title LIKE?","%#{word}%")
  end

end

