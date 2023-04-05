class ChangeDatatypePrefectureOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :prefecture, :integer
  end
end
