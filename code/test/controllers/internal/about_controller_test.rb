require 'test_helper'

class Internal::AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internal_about_index_url
    assert_response :success
  end

end
