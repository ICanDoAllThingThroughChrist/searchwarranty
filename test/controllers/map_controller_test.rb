require 'test_helper'

class MapControllerTest < ActionDispatch::IntegrationTest
  test "should get index--skip-helper" do
    get map_index--skip-helper_url
    assert_response :success
  end

end
