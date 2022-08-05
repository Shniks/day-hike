require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a trail show page' do
    it 'I can see the name, address and length of the hike' do

      trip = Trip.create!(name: "Early August")

      trail_1 = Trail.create!(name: "Mist Trail", address: "Mist Trail Road, Yosemite Valley", length: 7.5)
      trail_2 = Trail.create!(name: "4 Mile Trail", address: "4 Mile Trailhead, Yosemite Valley", length: 12.0)
      trail_3 = Trail.create!(name: "Mirror Lake Loop", address: "Mirror Lake, Yosemite Valley", length: 4.6)

      TripTrail.create!(trip: trip, trail: trail_1)
      TripTrail.create!(trip: trip, trail: trail_2)
      TripTrail.create!(trip: trip, trail: trail_3)

      visit "/trails/#{trail_1.id}"

      expect(page).to have_content("#{trail_1.name}")
      expect(page).to have_content("#{trail_1.address}")
      expect(page).to have_content("#{trail_1.length}")

      visit "/trails/#{trail_2.id}"

      expect(page).to have_content("#{trail_2.name}")
      expect(page).to have_content("#{trail_2.address}")
      expect(page).to have_content("#{trail_2.length}")

      visit "/trails/#{trail_3.id}"

      expect(page).to have_content("#{trail_3.name}")
      expect(page).to have_content("#{trail_3.address}")
      expect(page).to have_content("#{trail_3.length}")
    end
  end
end
