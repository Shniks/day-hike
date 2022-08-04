class Trail < ApplicationRecord
  validates_presence_of :name, :address, :length
  has_many  :trip_trails
  has_many  :trips, through: :trip_trails

end
