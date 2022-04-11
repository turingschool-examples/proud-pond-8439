class Ride < ApplicationRecord
  belongs_to :amusement_park

  def self.thrill_level
    order(thrill_rating: :desc)
  end
end
