class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating
  validates_presence_of :open
  belongs_to :amusement_park
  has_and_belongs_to_many :mechanics
end
