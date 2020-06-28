class Cart < ApplicationRecord
  has_many :items, dependent: :destroy

  def add_product(product_id)
    # Co the dung tính năng Dynamic Finders trong => find_by_<tên cột>
    current_item = items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      # Neu trong list items ban dau khong co san pham ma ta dinh them vao thi them moi vao list item do
      current_item = items.build(product_id: product_id)
    end
    # Tra ve doi tuong item hien tai
    current_item
  end

  def total_price
    items.to_a.sum{ |item| item.total_price }
  end
end
