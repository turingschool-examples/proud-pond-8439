class AmusementParksController < ApplicationController

  def show
    @amusement_park = AmusementPark.find(params[:id])
    @rides = @amusement_park.rides.order(:name)
    @average_thrill = @rides.average(:thrill_rating)
  end
end
