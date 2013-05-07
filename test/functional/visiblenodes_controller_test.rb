require 'test_helper'

class VisiblenodesControllerTest < ActionController::TestCase
  setup do
    @visiblenode = visiblenodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visiblenodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visiblenode" do
    assert_difference('Visiblenode.count') do
      post :create, visiblenode: { node_id: @visiblenode.node_id, player_id: @visiblenode.player_id }
    end

    assert_redirected_to visiblenode_path(assigns(:visiblenode))
  end

  test "should show visiblenode" do
    get :show, id: @visiblenode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visiblenode
    assert_response :success
  end

  test "should update visiblenode" do
    put :update, id: @visiblenode, visiblenode: { node_id: @visiblenode.node_id, player_id: @visiblenode.player_id }
    assert_redirected_to visiblenode_path(assigns(:visiblenode))
  end

  test "should destroy visiblenode" do
    assert_difference('Visiblenode.count', -1) do
      delete :destroy, id: @visiblenode
    end

    assert_redirected_to visiblenodes_path
  end
end
