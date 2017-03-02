require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get yandex" do
    get welcome_yandex_url
    assert_response :success
  end

  test "should get google" do
    get welcome_google_url
    assert_response :success
  end

  test "should get geeks" do
    get welcome_geeks_url
    assert_response :success
  end

end
