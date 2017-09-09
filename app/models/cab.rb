class Cab < ApplicationRecord
  has_many :rides
  validates :number, :contact_number, :curr_lat, :curr_long, presence: true
end
