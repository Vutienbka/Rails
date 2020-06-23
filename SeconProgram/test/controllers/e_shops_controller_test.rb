require 'test_helper'

class EShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_shop = e_shops(:one)
  end

  test "should get index" do
    get e_shops_url
    assert_response :success
  end

  test "should get new" do
    get new_e_shop_url
    assert_response :success
  end

  test "should create e_shop" do
    assert_difference('EShop.count') do
      post e_shops_url, params: { e_shop: { description: @e_shop.description, price: @e_shop.price, productImage: @e_shop.productImage, productName: @e_shop.productName, quantity: @e_shop.quantity } }
    end

    assert_redirected_to e_shop_url(EShop.last)
  end

  test "should show e_shop" do
    get e_shop_url(@e_shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_e_shop_url(@e_shop)
    assert_response :success
  end

  test "should update e_shop" do
    patch e_shop_url(@e_shop), params: { e_shop: { description: @e_shop.description, price: @e_shop.price, productImage: @e_shop.productImage, productName: @e_shop.productName, quantity: @e_shop.quantity } }
    assert_redirected_to e_shop_url(@e_shop)
  end

  test "should destroy e_shop" do
    assert_difference('EShop.count', -1) do
      delete e_shop_url(@e_shop)
    end

    assert_redirected_to e_shops_url
  end
end
