require 'test_helper'

class PickedThingsControllerTest < ActionController::TestCase
  setup do
    @picked_thing = picked_things(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:picked_things)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picked_thing" do
    assert_difference('PickedThing.count') do
      post :create, picked_thing: { thing_id: @picked_thing.thing_id, user_id: @picked_thing.user_id }
    end

    assert_redirected_to picked_thing_path(assigns(:picked_thing))
  end

  test "should show picked_thing" do
    get :show, id: @picked_thing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @picked_thing
    assert_response :success
  end

  test "should update picked_thing" do
    patch :update, id: @picked_thing, picked_thing: { thing_id: @picked_thing.thing_id, user_id: @picked_thing.user_id }
    assert_redirected_to picked_thing_path(assigns(:picked_thing))
  end

  test "should destroy picked_thing" do
    assert_difference('PickedThing.count', -1) do
      delete :destroy, id: @picked_thing
    end

    assert_redirected_to picked_things_path
  end
end
