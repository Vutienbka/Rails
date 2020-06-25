class Item < ApplicationRecord
  belongs_to :cart
  belongs_to :e_shop

  def total_price
    return e_shop.price * quantity
  end
end
