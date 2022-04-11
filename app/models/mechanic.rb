class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  validates_presence_of :name
  validates_presence_of :years_experience

  def self.avg_yrs_experience
    average(:years_experience)
  end

  def order_by_thrill
    rides.order(thrill_rating: :desc)
  end
  #couldn't decide if this should live here or in the rides model as a class method
end
