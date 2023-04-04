class CreateCommunityReqs < ActiveRecord::Migration[6.1]
  def change
    create_table :community_reqs do |t|
      t.integer  :user_id
      t.string   :title
      t.text     :body
      t.integer  :update_status
      t.timestamps
    end
  end
end
