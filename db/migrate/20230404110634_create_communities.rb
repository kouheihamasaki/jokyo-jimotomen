class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.integer  :admin_id
      t.string   :prefecture
      t.string   :title
      t.text     :introduction
      t.timestamps
    end
  end
end
