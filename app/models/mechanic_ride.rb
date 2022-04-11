class MechanicRide < ActiveRecord::Base
  belongs_to :mechanic
  belongs_to :ride
end
