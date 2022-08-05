require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a trip show page' do
    it 'I can see a list of names of all hikes' do

      trip = Trip.create!(name: "Early August")

      trail_1 = Trail.create!(name: "Mist Trail", address: "Mist Trail Road, Yosemite Valley", length: 7.5)
      trail_2 = Trail.create!(name: "4 Mile Trail", address: "4 Mile Trailhead, Yosemite Valley", length: 12.0)
      trail_3 = Trail.create!(name: "Mirror Lake Loop", address: "Mirror Lake, Yosemite Valley", length: 4.6)

      TripTrail.create!(trip: trip, trail: trail_1)
      TripTrail.create!(trip: trip, trail: trail_2)
      TripTrail.create!(trip: trip, trail: trail_3)

      visit '/trips/1'

      expect(page).to have_content('Mist Trail')
      expect(page).to have_content('4 Mile Trail')
      expect(page).to have_content('Mirror Lake Loop')
    end
  end
end
