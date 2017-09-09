require 'test_helper'

class CabsHelperTest < ActionView::TestCase

  def cab
  	Cab.create(number: 'KL 15 6565', contact_number: '1234567890',
      curr_lat: 11.2587531, curr_long: 75.78041)
  end
 
  test "current location" do
    assert current_location(cab)
  end

end
