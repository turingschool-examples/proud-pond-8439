class Ride < ApplicationRecord
  belongs_to :amusement_park
  belongs_to :mechanic
  has_many :mechanics

  validates_presence_of :name
  validates_presence_of :thrill_rating
  validates_presence_of :open
end
