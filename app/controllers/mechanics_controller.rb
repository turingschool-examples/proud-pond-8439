class MechanicsController < ApplicationController

  def index
    @mechanic = Mechanic.all
  end
end
