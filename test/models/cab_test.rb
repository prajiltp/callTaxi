require 'test_helper'

class CabTest < ActiveSupport::TestCase

  def cab
  	Cab.create(number: 'KL 15 6565', contact_number: '1234567890',
      curr_lat: 11.2587531, curr_long: 75.78041)
  end

  test 'change availability' do
    assert cab.change_availability
    assert cab.change_availability(11.2466631, 75.78107349999999)
  end
end
