require 'test_helper'
# truoc khi test tac hay lenh  rake db:migrate RAILS_ENV=test de tao ra bang CSDL trong moi truong test
class EShopTest < ActiveSupport::TestCase
  test "Price must be greater than or equal to 1000000" do # Ten chuong trinh test
    #Khoi tao truoc cac thuoc tinh
    e_shop = EShop.new(productImage: 'Iphone.jeg',
                       productName: '',
                       price: 1000,
                       quantity: 2)
    #Kiem tra validate cac truong co dung khong
    assert e_shop.invalid?
    # assert e_shop.valid?
    assert_equal "Price must be greater than or equal to 1000000", e_shop.errors[:price].join('')
    assert_equal "can't be blank", e_shop.errors[:productName].join('')
    assert_equal "ProductImage must be .gif, .jpeg, .jpr or ,png", e_shop.errors[:productImage].join('')
  end
end
# Sau do ta chay lenh: "rake test:units"  truoc ghi run test
# Cuoi cung bam chuot phai va run test
