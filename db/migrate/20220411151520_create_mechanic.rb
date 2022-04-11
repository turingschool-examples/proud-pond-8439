class CreateMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :years_experience
      t.has_many :rides
      t.belongs_to :ride
      t.references :rides, foreign_key: true
      # t.index ["mechanic_id"], name: "index_rides_on_mechanic_id"

      t.timestamp
    end
  end

end
