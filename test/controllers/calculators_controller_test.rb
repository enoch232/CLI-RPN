require 'test_helper'

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get calculate" do
    get calculators_calculate_url
    assert_response :success
  end

end
