class CreateEachUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :each_users do |t|

      t.timestamps
    end
  end
end
