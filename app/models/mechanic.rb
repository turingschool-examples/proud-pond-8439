class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years_experience
    average(:years_experience)
  end


  def open_rides_by_rating
    rides.where('open = true').order(thrill_rating: :desc)
  end
end
