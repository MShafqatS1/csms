require "test_helper"

class TechnicianControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get technician_index_url
    assert_response :success
  end
end
