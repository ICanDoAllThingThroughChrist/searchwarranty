require 'test_helper'

class SrsControllerTest < ActionDispatch::IntegrationTest
  test "should get misc_summary" do
    get srs_misc_summary_url
    assert_response :success
  end

end
