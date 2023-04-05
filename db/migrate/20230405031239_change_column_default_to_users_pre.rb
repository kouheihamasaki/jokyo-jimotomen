class ChangeColumnDefaultToUsersPre < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :prefecture, from: nil, to:"0"
  end
end
