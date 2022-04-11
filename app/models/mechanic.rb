class Mechanic < ApplicationRecord
  validates :name, presence: true
  validates :years_of_experience, presence: true, numericality: true

  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides

  def self.average_experience
    average(:years_of_experience).round(2)
  end
end
