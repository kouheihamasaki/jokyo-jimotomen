class Community < ApplicationRecord

  belongs_to :admin
  has_many   :community_comment


  def self.looks(word)
    @community = Community.where("title LIKE?","%#{word}%")
  end

end
