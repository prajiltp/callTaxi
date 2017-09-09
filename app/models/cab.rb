class Cab < ApplicationRecord
  has_many :rides
  validates :number, :contact_number, :curr_lat, :curr_long, presence: true
  scope :available, -> {where('available=?', true)}
  scope :pink_cabs, -> {where('pink=?', true)}

  reverse_geocoded_by :curr_lat, :curr_long

  def change_availability(lat=nil, long=nil)
    self.available = !available
    if (lat && long)
      self.curr_lat = lat
      self.curr_long = long
    end
    self.save
  end

end
