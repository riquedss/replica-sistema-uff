require "test_helper"

class PeriodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get periods_index_url
    assert_response :success
  end

  test "should get show" do
    get periods_show_url
    assert_response :success
  end

  test "should get create" do
    get periods_create_url
    assert_response :success
  end

  test "should get update" do
    get periods_update_url
    assert_response :success
  end

  test "should get delete" do
    get periods_delete_url
    assert_response :success
  end
end
