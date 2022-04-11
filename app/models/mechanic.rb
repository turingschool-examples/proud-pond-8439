class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_experience
    Mechanic.average(:years_experience)
  end

  def all_open_rides
    rides
    .where(open: true)
    .order(thrill_rating: :desc)
  end
end
