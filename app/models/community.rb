class Community < ApplicationRecord

  belongs_to :admin
  has_many   :community_comment

  # ワード検索機能
  def self.looks(word)
    @community = Community.where("title LIKE?","%#{word}%")
  end
  

end
