class AddMechanicToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :mechanic, foreign_key: true
  end
end
