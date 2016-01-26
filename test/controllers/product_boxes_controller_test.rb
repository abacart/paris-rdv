require 'test_helper'

class ProductBoxesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get add_product" do
    get :add_product
    assert_response :success
  end

  test "should get remove_product" do
    get :remove_product
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
