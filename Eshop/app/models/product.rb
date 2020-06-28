class Product < ApplicationRecord
  validates :productName, uniqueness: true
  has_many :items, dependent: :destroy

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

  def self.search search
    if search
      where(["productName LIKE?", "%#{search}%"])
    else
      all
    end
  end

end
