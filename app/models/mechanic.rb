class Mechanic < ApplicationRecord

  #belongs_to :
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def open_rides
    Ride.joins(:mechanics).where("open=true").order("thrill_rating DESC")
  end

end
