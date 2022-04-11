class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.alphabetical_rides
  end
end
