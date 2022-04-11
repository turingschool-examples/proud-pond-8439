class CreateJoinTableRideMechanics < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rides, :mechanics do |t|
      # t.index [:ride_id, :mechanic_id]
      # t.index [:mechanic_id, :ride_id]
    end
  end
end
