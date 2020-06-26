class Product < ApplicationRecord
  validates :productName, uniqueness: true
end
