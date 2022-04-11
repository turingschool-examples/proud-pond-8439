class Mechanic < ApplicationRecord

belongs_to :ride
has_many :rides
validates_presence_of (:name)
validates_presence_of (:years_experience)

end
