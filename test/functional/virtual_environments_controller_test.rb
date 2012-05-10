require 'test_helper'

class VirtualEnvironmentsControllerTest < ActionController::TestCase
  setup do
    @virtual_environment = virtual_environments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:virtual_environments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create virtual_environment" do
    assert_difference('VirtualEnvironment.count') do
      post :create, virtual_environment: { image_name: @virtual_environment.image_name, ip: @virtual_environment.ip, mac: @virtual_environment.mac, machine_id: @virtual_environment.machine_id, name: @virtual_environment.name, note: @virtual_environment.note, tap: @virtual_environment.tap, vnc: @virtual_environment.vnc }
    end

    assert_redirected_to virtual_environment_path(assigns(:virtual_environment))
  end

  test "should show virtual_environment" do
    get :show, id: @virtual_environment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @virtual_environment
    assert_response :success
  end

  test "should update virtual_environment" do
    put :update, id: @virtual_environment, virtual_environment: { image_name: @virtual_environment.image_name, ip: @virtual_environment.ip, mac: @virtual_environment.mac, machine_id: @virtual_environment.machine_id, name: @virtual_environment.name, note: @virtual_environment.note, tap: @virtual_environment.tap, vnc: @virtual_environment.vnc }
    assert_redirected_to virtual_environment_path(assigns(:virtual_environment))
  end

  test "should destroy virtual_environment" do
    assert_difference('VirtualEnvironment.count', -1) do
      delete :destroy, id: @virtual_environment
    end

    assert_redirected_to virtual_environments_path
  end
end
