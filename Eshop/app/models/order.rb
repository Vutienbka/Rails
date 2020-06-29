class Order < ApplicationRecord
  PAYMENT_TYPES = ["Cash on delivery", "Credit cart", "Bank cart", "Papal", "Ebay"]
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
  validates :buyerName, :address, :email, :pay_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  # Chuyen tat ca cac items trong cart hien tai vao order de thanh toan dong thoi huy gio hang sau khi dat hang xong
  def add_items_from_current_cart(cart)
    cart.items.each do |item|
      item.cart_id = nil
      items << item
    end
  end
end
