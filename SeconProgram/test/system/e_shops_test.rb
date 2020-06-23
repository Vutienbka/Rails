require "application_system_test_case"

class EShopsTest < ApplicationSystemTestCase
  setup do
    @e_shop = e_shops(:one)
  end

  test "visiting the index" do
    visit e_shops_url
    assert_selector "h1", text: "E Shops"
  end

  test "creating a E shop" do
    visit e_shops_url
    click_on "New E Shop"

    fill_in "Description", with: @e_shop.description
    fill_in "Price", with: @e_shop.price
    fill_in "Productimage", with: @e_shop.productImage
    fill_in "Productname", with: @e_shop.productName
    fill_in "Quantity", with: @e_shop.quantity
    click_on "Create E shop"

    assert_text "E shop was successfully created"
    click_on "Back"
  end

  test "updating a E shop" do
    visit e_shops_url
    click_on "Edit", match: :first

    fill_in "Description", with: @e_shop.description
    fill_in "Price", with: @e_shop.price
    fill_in "Productimage", with: @e_shop.productImage
    fill_in "Productname", with: @e_shop.productName
    fill_in "Quantity", with: @e_shop.quantity
    click_on "Update E shop"

    assert_text "E shop was successfully updated"
    click_on "Back"
  end

  test "destroying a E shop" do
    visit e_shops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "E shop was successfully destroyed"
  end
end
