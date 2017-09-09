class Ride < ApplicationRecord
  belongs_to :cab
  enum status: %w(pending progress finished)
  attr_accessor :pickup_point, :pink, :drop_point

  validates :contact_number, :starting_latt, :starting_long, :end_latt, :end_long, :cab_id, presence: true

 
end
