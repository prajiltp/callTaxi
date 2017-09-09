class CabsController < ApplicationController
  def index
    @cabs = Cab.all
    @ride = Ride.new
  end
end
