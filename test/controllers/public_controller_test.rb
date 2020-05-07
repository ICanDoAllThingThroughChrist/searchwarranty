require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get 1st-monday-OverdueHvy" do
    get public_1st-monday-OverdueHvy_url
    assert_response :success
  end

end
