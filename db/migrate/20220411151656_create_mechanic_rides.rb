class CreateMechanicRides < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanic_rides do |t|
      t.references :mechanics, foreign_key: true
      t.references :rides, foreign_key: true
    end
  end
end
