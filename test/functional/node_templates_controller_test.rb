require 'test_helper'

class NodeTemplatesControllerTest < ActionController::TestCase
  setup do
    @node_template = node_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:node_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create node_template" do
    assert_difference('NodeTemplate.count') do
      post :create, node_template: { desc: @node_template.desc, firewall: @node_template.firewall, name: @node_template.name, pilot: @node_template.pilot, programset_id: @node_template.programset_id, response: @node_template.response, signal: @node_template.signal, signal: @node_template.signal, system: @node_template.system, user_id: @node_template.user_id }
    end

    assert_redirected_to node_template_path(assigns(:node_template))
  end

  test "should show node_template" do
    get :show, id: @node_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @node_template
    assert_response :success
  end

  test "should update node_template" do
    put :update, id: @node_template, node_template: { desc: @node_template.desc, firewall: @node_template.firewall, name: @node_template.name, pilot: @node_template.pilot, programset_id: @node_template.programset_id, response: @node_template.response, signal: @node_template.signal, signal: @node_template.signal, system: @node_template.system, user_id: @node_template.user_id }
    assert_redirected_to node_template_path(assigns(:node_template))
  end

  test "should destroy node_template" do
    assert_difference('NodeTemplate.count', -1) do
      delete :destroy, id: @node_template
    end

    assert_redirected_to node_templates_path
  end
end
