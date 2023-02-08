require "test_helper"

class ClimateDataControllerTest < ActionDispatch::IntegrationTest

  fixtures 'api/v2/measured_data'

  test "the truth" do
    puts api_v2_measured_data(:datum_1)
    assert true
  end
end
