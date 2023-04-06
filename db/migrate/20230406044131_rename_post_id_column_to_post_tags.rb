class RenamePostIdColumnToPostTags < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_tags, :post_id, :post
  end
end
