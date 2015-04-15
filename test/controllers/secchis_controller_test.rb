require 'test_helper'

class SecchisControllerTest < ActionController::TestCase
  setup do
    @secchi = secchis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:secchis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create secchi" do
    assert_difference('Secchi.count') do
      post :create, secchi: {  }
    end

    assert_redirected_to secchi_path(assigns(:secchi))
  end

  test "should show secchi" do
    get :show, id: @secchi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @secchi
    assert_response :success
  end

  test "should update secchi" do
    patch :update, id: @secchi, secchi: {  }
    assert_redirected_to secchi_path(assigns(:secchi))
  end

  test "should destroy secchi" do
    assert_difference('Secchi.count', -1) do
      delete :destroy, id: @secchi
    end

    assert_redirected_to secchis_path
  end
end
