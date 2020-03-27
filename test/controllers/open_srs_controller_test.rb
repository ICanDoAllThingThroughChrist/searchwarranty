require 'test_helper'

class OpenSrsControllerTest < ActionDispatch::IntegrationTest
  test "should get monthly_quality_grade" do
    get open_srs_monthly_quality_grade_url
    assert_response :success
  end

end
