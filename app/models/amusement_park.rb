class AmusementPark < ApplicationRecord
  has_many :rides

  def admission_cost_to_currency
    "%.2f" % admission_cost.truncate(2)
  end

  def alphabetical_rides
    rides.order(:name)
  end
end
