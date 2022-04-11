class RideMechanicsController < ApplicationController

  def create
    mechanic = Mechanic.find(params[:id])
    RideMechanic.create(ride_id: Ride.find(params[:ride_id]).id, mechanic_id: mechanic.id)

    # both of these work but wondering which is better practice
    # RideMechanic.create(ride: Ride.find(params[:ride_id]), mechanic: mechanic)
    redirect_to "/mechanics/#{mechanic.id}"
  end
  
end
