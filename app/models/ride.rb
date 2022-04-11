class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.descending_thrill_and_open
    order(thrill_rating: :desc)
    .where(open: :true)
  end

end
