require 'test_helper'

class IntroControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get intro_index_url
    assert_response :success
  end

  test "should get show" do
    get intro_show_url
    assert_response :success
  end

end
