require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get productList" do
    get show_productList_url
    assert_response :success
  end

end
