require 'test_helper'

class GamesessionControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get gm" do
    get :gm
    assert_response :success
  end

  test "should get player" do
    get :player
    assert_response :success
  end

  test "should get manage" do
    get :manage
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
