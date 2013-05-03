require 'test_helper'

class ChummerControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get finish" do
    get :finish
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
