require "test_helper"

class Customer::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_items_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_items_show_url
    assert_response :success
  end
end
