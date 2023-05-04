class Tag < ApplicationRecord

  has_many  :post_tags, dependent: :destroy
  has_many  :posts, through: :post_tags, dependent: :destroy

  enum tag_kind: { prefecture: 0, genre: 1, others_tag:2 }

end

