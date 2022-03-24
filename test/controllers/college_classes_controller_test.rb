require "test_helper"

class CollegeClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get college_classes_index_url
    assert_response :success
  end

  test "should get show" do
    get college_classes_show_url
    assert_response :success
  end

  test "should get create" do
    get college_classes_create_url
    assert_response :success
  end

  test "should get update" do
    get college_classes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get college_classes_destroy_url
    assert_response :success
  end
end
