class AmusementPark < ApplicationRecord
  has_many :rides

  def sort_rides
    rides.order(:name)
  end
end
