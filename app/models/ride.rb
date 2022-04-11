class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating
  validates_inclusion_of :open, :in => [true, false]
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  
end
