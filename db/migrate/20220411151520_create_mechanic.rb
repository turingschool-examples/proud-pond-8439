class CreateMechanic < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :years_experience
      t.references :ride, foreign_key: true
      # t.has_many :rides
      # t.belongs_to :ride

      t.timestamp
    end
  end

end
