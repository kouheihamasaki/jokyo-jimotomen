class ChangeDatatypeTagIdOfPostTags < ActiveRecord::Migration[6.1]
  def change
    change_column :post_tags, :tag_id, :reference, foreign_key: true
  end
end
