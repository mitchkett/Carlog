require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, :vehicle => { }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, :id => vehicles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vehicles(:one).to_param
    assert_response :success
  end

  test "should update vehicle" do
    put :update, :id => vehicles(:one).to_param, :vehicle => { }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, :id => vehicles(:one).to_param
    end

    assert_redirected_to vehicles_path
  end
end
