class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :e_shop_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
