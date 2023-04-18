class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      # t.integer  :post_tag_id
      t.string   :name
      t.integer  :tag_kind
      t.timestamps
    end
  end
end
