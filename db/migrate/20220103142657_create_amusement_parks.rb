class CreateAmusementParks < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_parks do |t|
      t.string :name
      t.integer :admission_cost
      t.has_many :rides
      t.timestamps
    end
  end
end
