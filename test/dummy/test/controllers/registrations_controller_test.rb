require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post registrations_url, params: { registration: { age: @registration.age, date_of_birth: @registration.date_of_birth, email: @registration.email, first_name: @registration.first_name, last_name: @registration.last_name, middle_initial: @registration.middle_initial } }
    end

    assert_redirected_to registration_url(Registration.last)
  end

  test "should show registration" do
    get registration_url(@registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_url(@registration)
    assert_response :success
  end

  test "should update registration" do
    patch registration_url(@registration), params: { registration: { age: @registration.age, date_of_birth: @registration.date_of_birth, email: @registration.email, first_name: @registration.first_name, last_name: @registration.last_name, middle_initial: @registration.middle_initial } }
    assert_redirected_to registration_url(@registration)
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete registration_url(@registration)
    end

    assert_redirected_to registrations_url
  end
end
