class RidesController < ApplicationController
  before_action :set_ride, only: %I[start finish]
  def create
    @pickup_point = rides_params[:pickup_point]
    @drop_point = rides_params[:drop_point]
    set_start_location if @pickup_point
    set_drop_location if @drop_point
    ride = Ride.new(params.require(:ride).permit!)
    @ride, @errors = ride.assign_cab
  end

  def start
    @errors = @ride.start if @ride
  end

  def finish
    @distance, @cost_by_distance, @travel_time, @cost_by_time, @errors = @ride.finish if @ride
  end

  private

  def rides_params
    params[:ride]
  end

  def set_start_location
    res_coordinates = get_coordinate(@pickup_point)
    if res_coordinates
      params[:ride][:starting_latt] = res_coordinates.first
      params[:ride][:starting_long] = res_coordinates.last
    end
    res_coordinates
  end

  def set_drop_location
    res_coordinates = get_coordinate(@drop_point)
    if res_coordinates
      params[:ride][:end_latt] = res_coordinates.first
      params[:ride][:end_long] = res_coordinates.last
    end
    res_coordinates
  end

  def get_coordinate(point)
    Geocoder.coordinates(point)
  end

  def set_ride
    @ride = Ride.find_by_id(params[:id])
    @error = 'No ride match your request' unless @ride
  end
end
