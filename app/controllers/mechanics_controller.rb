class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_years_experience = Mechanic.average_years_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    # require 'pry'; binding.pry
    @open_rides = @mechanic.rides.where(open: true).order(thrill_rating: :desc)
    # require 'pry'; binding.pry
  end

  def new
    @mechanic = Mechanic.find(params[:id])
    new_ride = Ride.find(params[:ride_id])
    # require 'pry'; binding.pry
    @mechanic.rides.create!(name: new_ride.name,
                            amusement_park_id: new_ride.amusement_park_id,
                            thrill_rating: new_ride. thrill_rating,
                            open: new_ride.open)
    @mechanic.save
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
