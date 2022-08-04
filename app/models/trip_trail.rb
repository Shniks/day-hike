class TripTrail < ApplicationRecord
  belongs_to  :trips
  belongs_to  :trails 

end
