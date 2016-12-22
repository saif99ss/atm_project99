require 'test_helper'

class AddAtmMachinesControllerTest < ActionController::TestCase
  setup do
    @add_atm_machine = add_atm_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_atm_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_atm_machine" do
    assert_difference('AddAtmMachine.count') do
      post :create, add_atm_machine: { address: @add_atm_machine.address, city: @add_atm_machine.city, latitude: @add_atm_machine.latitude, longitude: @add_atm_machine.longitude, name: @add_atm_machine.name, street: @add_atm_machine.street }
    end

    assert_redirected_to add_atm_machine_path(assigns(:add_atm_machine))
  end

  test "should show add_atm_machine" do
    get :show, id: @add_atm_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_atm_machine
    assert_response :success
  end

  test "should update add_atm_machine" do
    patch :update, id: @add_atm_machine, add_atm_machine: { address: @add_atm_machine.address, city: @add_atm_machine.city, latitude: @add_atm_machine.latitude, longitude: @add_atm_machine.longitude, name: @add_atm_machine.name, street: @add_atm_machine.street }
    assert_redirected_to add_atm_machine_path(assigns(:add_atm_machine))
  end

  test "should destroy add_atm_machine" do
    assert_difference('AddAtmMachine.count', -1) do
      delete :destroy, id: @add_atm_machine
    end

    assert_redirected_to add_atm_machines_path
  end
end
