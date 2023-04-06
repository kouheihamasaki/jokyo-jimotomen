class RenameTagIdColumnToPostTags < ActiveRecord::Migration[6.1]
  def change
     rename_column :post_tags, :tag_id, :tag
  end
end
