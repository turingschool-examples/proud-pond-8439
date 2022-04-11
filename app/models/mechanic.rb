class Mechanic < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :years_experience

  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides

  def self.average_experience
    average(:years_experience)
  end
end