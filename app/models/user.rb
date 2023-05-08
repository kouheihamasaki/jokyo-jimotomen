class User < ApplicationRecord

  enum prefecture: {
    "---":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
  }

  has_many   :post, dependent: :destroy
  has_many   :post_comment, dependent: :destroy
  has_many   :favorite, dependent: :destroy
  has_many   :community_comment, dependent: :destroy
  has_many   :community_req
  
  # フォローをした、されたの関係
  has_many   :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many   :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  # 一覧画面
  has_many   :followings, through: :relationships, source: :followed
  has_many   :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  def full_name
    self.last_name + " " + self.first_name
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.first_name = "さん"
      user.last_name = "ゲスト"
      user.first_name_kana ="サン"
      user.last_name_kana ="ゲスト"
      user.screen_name ="ゲストログイン中"
      user.introduction = "ゲストログイン中です"
      user.fav_noodle = "ゲストログイン中です"
    end
  end

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  # 画像データがなければデフォルト画像を出力する
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image_jokyo-jimotomen.png')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

