class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.has_many :mechanics
      t.belongs_to :mechanic
      t.references :mechanics, foreign_key: true
      t.belongs_to :amusement_park
      t.references :amusement_parks, foreign_key: true
      t.string :name
      t.integer :thrill_rating
      t.boolean :open

      t.timestamps
    end
  end
end
