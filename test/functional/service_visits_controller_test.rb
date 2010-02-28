require 'test_helper'

class ServiceVisitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_visit" do
    assert_difference('ServiceVisit.count') do
      post :create, :service_visit => { }
    end

    assert_redirected_to service_visit_path(assigns(:service_visit))
  end

  test "should show service_visit" do
    get :show, :id => service_visits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => service_visits(:one).to_param
    assert_response :success
  end

  test "should update service_visit" do
    put :update, :id => service_visits(:one).to_param, :service_visit => { }
    assert_redirected_to service_visit_path(assigns(:service_visit))
  end

  test "should destroy service_visit" do
    assert_difference('ServiceVisit.count', -1) do
      delete :destroy, :id => service_visits(:one).to_param
    end

    assert_redirected_to service_visits_path
  end
end
