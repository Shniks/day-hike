class TripTrail < ApplicationRecord
  has_many  :trips
  has_many  :trails 

end
