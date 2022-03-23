require "test_helper"

class CourseCoordinatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get course_coordinators_index_url
    assert_response :success
  end

  test "should get show" do
    get course_coordinators_show_url
    assert_response :success
  end

  test "should get create" do
    get course_coordinators_create_url
    assert_response :success
  end

  test "should get update" do
    get course_coordinators_update_url
    assert_response :success
  end

  test "should get destroy" do
    get course_coordinators_destroy_url
    assert_response :success
  end
end
