class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years_experience
    average("years_experience")
  end

  def ordered_rides
    binding.pry
    where(rides.open)
    #   open_rides = []
    #   rides.each do |ride|
    #     if ride.open
    #       open_rides << ride
    #     end
    #   end
    #   open_rides.order(:thrill_rating)
    # end
  end
end
