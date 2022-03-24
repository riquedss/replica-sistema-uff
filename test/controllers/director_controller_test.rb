require "test_helper"

class DirectorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get director_show_url
    assert_response :success
  end

  test "should get create" do
    get director_create_url
    assert_response :success
  end

  test "should get update" do
    get director_update_url
    assert_response :success
  end
end
