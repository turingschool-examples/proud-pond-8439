class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    # require "pry"; binding.pry
  end

  def create
    ride_id = params[:ride_id_number].to_i
    mech_id = params[:id].to_i

    if Ride.all.ids.include?(ride_id)
      ride = Ride.find(ride_id)
      @mechanic = Mechanic.find(mech_id)

      new_mech_ride = MechanicRide.create!(ride: ride, mechanic: @mechanic)

      new_mech_ride.save
      @mechanic.save
      redirect_to "/mechanics/#{@mechanic.id}"

    else
      flash[:notice] = "Error, no ride found"
      redirect_to "/mechanics/#{mech_id}"
    end
  end


end
