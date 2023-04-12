class RemoveScreenNameFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :screen_name, :string
  end
end
