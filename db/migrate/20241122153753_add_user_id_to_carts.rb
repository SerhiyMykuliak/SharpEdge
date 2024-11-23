class AddUserIdToCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :user_id, :bigint
    add_index :carts, :user_id
  end
end
