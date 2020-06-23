class CreateEShops < ActiveRecord::Migration[6.0]
  def change
    create_table :e_shops do |t|
      t.string :productImage
      t.string :productName
      t.integer :quantity
      t.float :price
      t.string :description

      t.timestamps null: false
    end
  end
end
