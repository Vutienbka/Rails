class RenameManufaturerToManufacturer < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :manufaturer, :manufacturer
  end
end
