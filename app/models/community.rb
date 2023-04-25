class Community < ApplicationRecord

  belongs_to :admin
  has_many   :community_comment

    validates :comment, presence: true

  def self.looks(word)
    @community = Community.where("title LIKE?","%#{word}%")
  end

end
