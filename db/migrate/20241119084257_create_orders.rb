class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.decimal :total
      t.string :delivery_method
      t.string :payment_method

      t.timestamps
    end
  end
end
