class AddRideToMechanics < ActiveRecord::Migration[5.2]
  def change
    add_reference :mechanics, :ride, foreign_key: true
  end
end
