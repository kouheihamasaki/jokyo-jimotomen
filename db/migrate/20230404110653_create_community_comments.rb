class CreateCommunityComments < ActiveRecord::Migration[6.1]
  def change
    create_table :community_comments do |t|
      t.integer :community_id
      t.integer :user_id
      t.text    :comment
      t.timestamps
    end
  end
end
