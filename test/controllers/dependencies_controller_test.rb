require "test_helper"

class DependenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dependencies_index_url
    assert_response :success
  end

  test "should get show" do
    get dependencies_show_url
    assert_response :success
  end

  test "should get create" do
    get dependencies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dependencies_destroy_url
    assert_response :success
  end
end
