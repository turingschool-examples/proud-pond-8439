class RideMechanic < ApplicationRecord
  belongs_to :ride
  belongs_to :mechanic

  def create
    @ride_mechanic = RideMechanic.create(ride_mechanic_params)
    redirect_to "/mechanics/#{@mechanic.id}"
    @ride_mechanic.save
  end
end
