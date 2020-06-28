class Search < ApplicationRecord

  def search_products
  products = Product.all
  products = Product.where(["productName LIKE?", "%#{keywords}%"]) if keywords.present?
  products = Product.where(["price >= ?", min_price]) if min_price.present?
  products = Product.where(["price >= ?", max_price]) if max_price.present?
  products = Product.where(["productName LIKE?", "%#{manufacturer}%"]) if manufacturer.present?
  return products
  end

end
