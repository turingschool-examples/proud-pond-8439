class Ride < ApplicationRecord
  belongs_to :amusement_park

  validates_presence_of :name
  validates_presence_of :thrill_rating
  validates :open, inclusion: [true, false]

  def self.alpha_order
    order(:name)
  end

  def self.avg_thrill
    average(:thrill_rating)
    # require "pry"; binding.pry
  end

end
