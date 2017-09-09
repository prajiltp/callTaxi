require 'test_helper'

class RidesControllerTest < ActionDispatch::IntegrationTest
  def cab
    Cab.create(number: 'KL 15 6565', contact_number: '1234567890',
      curr_lat: 11.2587531, curr_long: 75.78041)
  end

  def ride
    Ride.create(cab_id: cab.id, contact_number: '123456789', starting_latt: 11.2587531, 
      starting_long: 75.78041, end_latt: 12.9715987, end_long: 77.5945627, status: 0)
  end
  test "should create ride" do
    post rides_url, params: { ride: { contact_number: '1234567890', pickup_point: 'Kozhikode Railway station', drop_point: 'UL cyberpark kzhikode', pink: false } }
    assert_response :success
  end


  test "should put start" do
    put start_ride_url(ride), params: {}
    assert_response :success
  end

  test "should put finish" do
    put finish_ride_url(ride), params: {}
    assert_response :success
  end

end
