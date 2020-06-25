class Order < ApplicationRecord
  # neu xoa order thi items se bi xoa theo
  has_many :items, :dependent => :destroy
  PAYMENT_TYPES = [ "Cash on delivery", "Ngân lượng", "Bảo Kim", "Bank Card" ]
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_items_from_cart(cart)
    cart.items.each do |item|
      # Tranh bao loi khi xoa gio hang
      item.cart_id = nil
      items << item
    end
  end
end
