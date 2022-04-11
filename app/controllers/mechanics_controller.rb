class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.order(thrill_rating: :desc)
  end

  def update
    # @mechanic = Mechanic.find(params[:id])
    # Ride.all.each do |ride|
    #   if ride.id == params[:ride_id].to_i
    #     @mechanic.rides << ride
    #   end
    # end
    # @rides = @mechanic.rides.order(thrill_rating: :desc)
    # redirect_to "/mechanics/#{@mechanic.id}"

    mechanic = Mechanic.find(params[:id])
    ride = Ride.find_by(id: params[:ride_id])
    mechanic.add_ride(ride)
    mechanic.save
    redirect_to "/mechanics/#{mechanic.id}"
  end

end
