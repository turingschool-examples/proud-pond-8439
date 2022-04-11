class Mechanic < ApplicationRecord
  has_many :ride_mechanic
  has_many :ride, through: :ride_mechanic

  validates :name, presence: true
  validates :years_experience, numericality: true
end
