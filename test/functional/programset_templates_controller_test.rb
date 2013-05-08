require 'test_helper'

class ProgramsetTemplatesControllerTest < ActionController::TestCase
  setup do
    @programset_template = programset_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programset_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create programset_template" do
    assert_difference('ProgramsetTemplate.count') do
      post :create, programset_template: {  }
    end

    assert_redirected_to programset_template_path(assigns(:programset_template))
  end

  test "should show programset_template" do
    get :show, id: @programset_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @programset_template
    assert_response :success
  end

  test "should update programset_template" do
    put :update, id: @programset_template, programset_template: {  }
    assert_redirected_to programset_template_path(assigns(:programset_template))
  end

  test "should destroy programset_template" do
    assert_difference('ProgramsetTemplate.count', -1) do
      delete :destroy, id: @programset_template
    end

    assert_redirected_to programset_templates_path
  end
end
