class RemovePostTagIdFromTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :tags, :post_tag_id, :integer
  end
end
