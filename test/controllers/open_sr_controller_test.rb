require 'test_helper'

class OpenSrControllerTest < ActionDispatch::IntegrationTest
  test "should get missedHvySWTotal" do
    get open_sr_missedHvySWTotal_url
    assert_response :success
  end

end
