class AmusementPark < ApplicationRecord
  has_many :rides

  def alphabetical_rides
    rides.order(:name)
  end
end
