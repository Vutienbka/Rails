class EShop < ApplicationRecord
  validates :productName, :price, :quantity, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1000000, message: "Price must be greater than or equal to 1000000"}
  validates :productName, uniqueness: true
  validates :productImage, format: {with: %r{\.(gif|jpeg|jpg|png)}, message: "ProductImage must be .gif, .jpeg, .jpr or ,png"}
end
