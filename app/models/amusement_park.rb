class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :mechanic_rides

  def all_park_rides
    rides.order(name: :asc)
  end
end
