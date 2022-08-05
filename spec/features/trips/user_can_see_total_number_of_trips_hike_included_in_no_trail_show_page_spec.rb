require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a trail show page' do
    it 'I can see the total number of trips hike included in' do

      trip_1 = Trip.create!(name: "Early August")
      trip_2 = Trip.create!(name: "Mid August")
      trip_3 = Trip.create!(name: "Fall")

      trail_1 = Trail.create!(name: "Mist Trail", address: "Mist Trail Road, Yosemite Valley", length: 7.5)
      trail_2 = Trail.create!(name: "4 Mile Trail", address: "4 Mile Trailhead, Yosemite Valley", length: 12.0)

      TripTrail.create!(trip: trip_1, trail: trail_1)
      TripTrail.create!(trip: trip_2, trail: trail_1)
      TripTrail.create!(trip: trip_3, trail: trail_1)
      TripTrail.create!(trip: trip_1, trail: trail_2)
      TripTrail.create!(trip: trip_3, trail: trail_2)

      visit "/trails/#{trail_1.id}"

      expect(page).to have_content('Trips included in: 3')

      visit "/trails/#{trail_2.id}"

      expect(page).to have_content('Trips included in: 2')
    end
  end
end
