class AddRidesToMechanics < ActiveRecord::Migration[5.2]
  def change
    add_reference :mechanics, :rides, foreign_key: true
  end
end
