class AmusementPark < ApplicationRecord
  has_many :rides

  def sort_rides
    rides.order(:name)
  end

  def avg_thrills
    rides.average(:thrill_rating)
  end
end
