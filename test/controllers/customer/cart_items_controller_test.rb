require "test_helper"

class Customer::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_cart_items_index_url
    assert_response :success
  end
end
