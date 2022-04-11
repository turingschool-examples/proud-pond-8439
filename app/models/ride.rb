class Ride < ApplicationRecord
  validates :name, presence: true
  validates :thrill_rating, presence: true, numericality: true
  validates :open, inclusion: [true, false]

  belongs_to :amusement_park
end
