class Mechanic < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :years_experience

  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides

  def self.average_experience
    average(:years_experience)
  end

  def open_rides_by_thrill
    rides.where(open: true).order(thrill_rating: :desc)
  end
end