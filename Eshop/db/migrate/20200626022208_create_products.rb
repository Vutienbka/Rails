class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :productImage
      t.string :productName
      t.integer :quantity
      t.integer :price
      t.string :description
      t.string :manufaturer

      t.timestamps
    end
  end
end
