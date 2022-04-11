class RideMechanicsController < ApplicationController

  def new

  end

  def create
    ride_id = params[:ride_id].to_i
    mech_id = params[:id].to_i
    ride = Ride.find(ride_id)
    @mechanic = Mechanic.find(mech_id)
    new_ride_mech = RideMechanic.create!(ride_id: ride_id, mechanic_id: mech_id)
    new_ride_mech.save
    redirect_to "/mechanics/#{@mechanic.id}"
  end


  private

    def ride_mechanic_params
      params.permit(:ride_id, :mechanic_id)
    end
end
