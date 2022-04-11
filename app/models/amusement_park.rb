class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :ride_mechanics, through: :items
  has_many :mechanics, through: :ride_mechanics
end
