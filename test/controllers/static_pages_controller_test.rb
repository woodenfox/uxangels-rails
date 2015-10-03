require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get joinus" do
    get :joinus
    assert_response :success
  end

  test "should get requestus" do
    get :requestus
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
