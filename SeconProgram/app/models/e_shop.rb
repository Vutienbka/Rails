class EShop < ApplicationRecord
  validates :productName, :price, :quantity, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1000000, message: "Price must be greater than or equal to 1000000"}
  validates :productName, uniqueness: true
  validates :productImage, format: {with: %r{\.(gif|jpeg|jpg|png)}, message: "ProductImage must be .gif, .jpeg, .jpr or ,png"}

  has_many :items
  # dinh nghia helper kiem tra xem co item trong eShop hay khong
  before_destroy :check_if_has_item
  private

  # Kiem tra product nay co lien ket voi doi tuong item nao khong
  #  ngược lại thì chúng ta tạo một phần tử trong thuộc tính errors có khóa là :base
  # và giá trị là 'This product has a LineItem', rồi trả về false.
  def check_if_has_item
    if items.empty?
      return true
      else
        errors.add(:base, "this product has item")
        # before_destroy trả về false thì Rails sẽ không hủy đối tượng product nay
        return false
    end
  end


end
