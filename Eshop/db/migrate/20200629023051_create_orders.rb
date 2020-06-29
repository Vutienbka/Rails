class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :buyerName
      t.string :address
      t.string :email
      t.string :pay_type

      t.timestamps
    end
  end
end
