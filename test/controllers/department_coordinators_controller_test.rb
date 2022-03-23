require "test_helper"

class DepartmentCoordinatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get department_coordinators_index_url
    assert_response :success
  end

  test "should get show" do
    get department_coordinators_show_url
    assert_response :success
  end

  test "should get create" do
    get department_coordinators_create_url
    assert_response :success
  end

  test "should get update" do
    get department_coordinators_update_url
    assert_response :success
  end

  test "should get destroy" do
    get department_coordinators_destroy_url
    assert_response :success
  end
end
