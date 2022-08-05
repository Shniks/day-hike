require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a trip show page' do
    it 'I can see the planned total hiking distance' do

      trip_1 = Trip.create!(name: "Early August")
      trip_2 = Trip.create!(name: "Mid August")

      trail_1 = Trail.create!(name: "Mist Trail", address: "Mist Trail Road, Yosemite Valley", length: 7.5)
      trail_2 = Trail.create!(name: "4 Mile Trail", address: "4 Mile Trailhead, Yosemite Valley", length: 12.0)
      trail_3 = Trail.create!(name: "Mirror Lake Loop", address: "Mirror Lake, Yosemite Valley", length: 4.6)

      TripTrail.create!(trip: trip_1, trail: trail_1)
      TripTrail.create!(trip: trip_1, trail: trail_2)
      TripTrail.create!(trip: trip_2, trail: trail_3)
      TripTrail.create!(trip: trip_2, trail: trail_1)

      visit '/trips/2'
      save_and_open_page
      expect(page).to have_content('Planned Total Hiking Distance: 12.1 miles')
    end
  end
end
