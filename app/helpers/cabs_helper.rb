module CabsHelper
  def current_location(cab)
    Geocoder.search([cab.curr_lat, cab.curr_long]).first.try(:address)
  end
end
