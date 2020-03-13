require 'test_helper'

class OpenSrsControllerTest < ActionDispatch::IntegrationTest
  test "should get test12" do
    get open_srs_test12_url
    assert_response :success
  end

end
