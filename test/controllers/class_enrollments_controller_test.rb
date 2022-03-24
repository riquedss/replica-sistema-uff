require "test_helper"

class ClassEnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get class_enrollments_index_url
    assert_response :success
  end

  test "should get show" do
    get class_enrollments_show_url
    assert_response :success
  end

  test "should get create" do
    get class_enrollments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get class_enrollments_destroy_url
    assert_response :success
  end
end
