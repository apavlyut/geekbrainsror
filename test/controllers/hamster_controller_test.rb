require 'test_helper'

class HamsterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hamster_index_url
    assert_response :success
  end

end
