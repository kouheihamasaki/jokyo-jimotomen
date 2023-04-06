class ChangeDatatypePostIdOfPostTags < ActiveRecord::Migration[6.1]
  def change
    change_column :post_tags, :post_id, :reference, foreign_key: true
  end
end
