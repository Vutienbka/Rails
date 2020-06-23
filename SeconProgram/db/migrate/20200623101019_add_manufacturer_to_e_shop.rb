class AddManufacturerToEShop < ActiveRecord::Migration[6.0]
  def change
    add_column :e_shops, :manufacturer, :string
  end
end
