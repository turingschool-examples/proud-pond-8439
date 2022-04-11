class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.thrill_level
  end

  def new
    RideMechanic.create(ride_id: params[:ride], mechanic_id: params[:id])
    redirect_to "/mechanics/#{params[:id]}"
  end

end
