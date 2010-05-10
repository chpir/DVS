require 'test_helper'

class CodeVersionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:code_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create code_version" do
    assert_difference('CodeVersion.count') do
      post :create, :code_version => { }
    end

    assert_redirected_to code_version_path(assigns(:code_version))
  end

  test "should show code_version" do
    get :show, :id => code_versions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => code_versions(:one).to_param
    assert_response :success
  end

  test "should update code_version" do
    put :update, :id => code_versions(:one).to_param, :code_version => { }
    assert_redirected_to code_version_path(assigns(:code_version))
  end

  test "should destroy code_version" do
    assert_difference('CodeVersion.count', -1) do
      delete :destroy, :id => code_versions(:one).to_param
    end

    assert_redirected_to code_versions_path
  end
end
