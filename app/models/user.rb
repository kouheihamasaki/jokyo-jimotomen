class User < ApplicationRecord
  
  has_many   :post
  has_many   :post_comment
  has_many   :favorite
  has_many   :community_comment
  has_many   :community_req
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

