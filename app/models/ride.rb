class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.descending_thrill
    order(thrill_rating: :desc)
  end
  
end
