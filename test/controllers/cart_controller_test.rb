require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get add_product" do
    get :add_product
    assert_response :success
  end

  test "should get remove_product" do
    get :remove_product
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
