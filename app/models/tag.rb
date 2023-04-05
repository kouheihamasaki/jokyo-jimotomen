class Tag < ApplicationRecord
  
  has_many  :post_tag, dependent: :destroy
  
end


, dependent: :destroy