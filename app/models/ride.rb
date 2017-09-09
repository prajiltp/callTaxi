class Ride < ApplicationRecord
  belongs_to :cab
  enum status: %w(pending progress finished)
  attr_accessor :pickup_point, :pink, :drop_point

  validates :contact_number, :starting_latt, :starting_long, :end_latt, :end_long, :cab_id, presence: true

  def nearest_cab(cabs)
    # Find the nearest cab within 100 miles
    cabs.near([starting_latt, starting_long], 100).first
  end

  def assign_cab
  	available_cabs = cab_available_for_the_request
  	@errors = []
  	if available_cabs.blank?
  	  @errors  << "There are no cabs available for you request please try late."
  	else
  	  cab = nearest_cab(available_cabs)
      if cab
      	self.cab = cab
      	cab.change_availability
      	@errors << self.errors.messages unless self.save
      else
      	@errors << "No cab available at a reachable distance"
      end
  	end
  	[self, @errors]
  end

  def cab_available_for_the_request
  	cabs=Cab.available
  	if pink == "1" || pink == true 
  	  cabs = cabs.pink_cabs
  	end
    cabs
  end

  def caculate_billing
    @distance = Geocoder::Calculations.distance_between([starting_latt, starting_long], [end_latt, end_long], :units => :km)
    @travel_time = ((end_at.to_i - started_at.to_i) / 60).to_i  if started_at && end_at
    @cost_by_time = (@travel_time * CHARGE_PER_MIN).round(2)  if @travel_time
    @cost_by_distance = @distance * CHARGE_PER_KM.round(2) if @distance
    if cab. pink
      @cost_by_time += PINK_CAR_ADDITINAL if @cost_by_time
      @cost_by_distance += PINK_CAR_ADDITINAL if @cost_by_distance
    end
    [@distance, @cost_by_distance, @travel_time, @cost_by_time]
  end

  def start
    @errors = []
    if self.progress?
      @errors << "This ride is in #{self.status}"
    else
      self.started_at = Time.now
      self.status = Ride.statuses['progress']
      @errors << self.errors.messages unless self.save
    end
    @errors
  end

  def finish
    @errors = []
    if self.finished?
      @errors << "This ride is already finished"
    else
      self.end_at = Time.now
      self.status = Ride.statuses['finished']
      @errors << self.errors.messages unless self.save
      cab.change_availability(end_latt, end_long)
      @distance, @cost_by_distance, @travel_time, @cost_by_time = caculate_billing
    end
    [@distance, @cost_by_distance, @travel_time, @cost_by_time, @errors]
  end
end
