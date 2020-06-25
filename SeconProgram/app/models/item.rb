class Item < ApplicationRecord

  belongs_to :e_shop
  belongs_to :cart
  # thiet lap optional la true de co the khi ta them moi items thi khong
  # can bat buoc phai tao moi mot order
  belongs_to :order, optional: true
  # Sau khi tao nhap thong tin order thi moi them order_id vao cac item tuong ung
  def total_price
    return e_shop.price * quantity
  end
end
