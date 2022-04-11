class Mechanic < ApplicationRecord
  validates :name, presence: true
  validates :years_of_experience, presence: true, numericality: true

  has_many :rides

  def self.average_experience
    average(:years_of_experience).round(2)
  end
end
