class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.all_park_rides
    @average_thrill_rating = @park.avg_thrill_rating.to_f
  end
end
