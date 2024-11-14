class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :stock_quantity
      t.string :blade_material
      t.decimal :blade_length
      t.decimal :blade_thickness
      t.string :handle_material
      t.decimal :handle_length
      t.decimal :weight
      t.string :knife_type
      t.string :brand

      t.timestamps
    end
  end
end
