class Ride < ApplicationRecord
  belongs_to :amusement_park

  validates :name, presence: true
  validates :thrill_rating, presence: true, numericality: true
  validates :open, inclusion: [true, false]
end
