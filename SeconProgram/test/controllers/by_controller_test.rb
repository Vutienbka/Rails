require 'test_helper'

class ByControllerTest < ActionDispatch::IntegrationTest
  test "should get Product" do
    get by_Product_url
    assert_response :success
  end

end
