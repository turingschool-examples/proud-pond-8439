class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_exp = Mechanic.average(:experience)
  end

end
