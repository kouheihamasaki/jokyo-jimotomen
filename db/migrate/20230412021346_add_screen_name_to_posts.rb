class AddScreenNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :screen_name, :string
  end
end
