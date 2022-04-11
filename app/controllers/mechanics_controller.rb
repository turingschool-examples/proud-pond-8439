class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @avg_experience = Mechanic.avg_years_experience.round(1).to_f
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.all_open_rides
  end

  def update
      @ride = Ride.find(params["Ride Id"])
      @mechanic = Mechanic.find(params[:id])
      @mechanic.rides << @ride

      redirect_to "/mechanics/#{@mechanic.id}"
  end
end
