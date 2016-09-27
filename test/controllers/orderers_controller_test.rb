require 'test_helper'

class OrderersControllerTest < ActionController::TestCase
  setup do
    @orderer = orderers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orderers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orderer" do
    assert_difference('Orderer.count') do
      post :create, orderer: { name: @orderer.name }
    end

    assert_redirected_to orderer_path(assigns(:orderer))
  end

  test "should show orderer" do
    get :show, id: @orderer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orderer
    assert_response :success
  end

  test "should update orderer" do
    patch :update, id: @orderer, orderer: { name: @orderer.name }
    assert_redirected_to orderer_path(assigns(:orderer))
  end

  test "should destroy orderer" do
    assert_difference('Orderer.count', -1) do
      delete :destroy, id: @orderer
    end

    assert_redirected_to orderers_path
  end
end
