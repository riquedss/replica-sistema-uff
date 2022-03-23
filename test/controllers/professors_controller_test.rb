require "test_helper"

class ProfessorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professors_index_url
    assert_response :success
  end

  test "should get show" do
    get professors_show_url
    assert_response :success
  end

  test "should get create" do
    get professors_create_url
    assert_response :success
  end

  test "should get update" do
    get professors_update_url
    assert_response :success
  end

  test "should get delete" do
    get professors_delete_url
    assert_response :success
  end
end
