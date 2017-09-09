require 'test_helper'

class RideTest < ActiveSupport::TestCase
  def cab
  	Cab.create(number: 'KL 15 6565', contact_number: '1234567890',
      curr_lat: 11.2587531, curr_long: 75.78041)
  end

  def ride
   Ride.create(cab_id: cab.id, contact_number: '123456789', starting_latt: 11.2587531, 
     starting_long: 75.78041, end_latt: 12.9715987, end_long: 77.5945627, status: 0)
  end

  test "nearest cab" do
  	assert ride.nearest_cab(Cab.all)
  end

  test "assign_cab" do 
  	assert ride.assign_cab
  end

  test "cab_available_for_the_request" do
  	assert ride.cab_available_for_the_request
  end

  test "caculate_billing" do
    assert ride.caculate_billing
  end

  test "start" do
    assert ride.start
  end

  test "finish" do
    assert ride.finish
  end
end
