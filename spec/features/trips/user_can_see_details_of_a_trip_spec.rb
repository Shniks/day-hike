require 'rails_helper'

RSpec.describe 'When I visit the trips index and click on link to a trip show' do
  describe 'I see a list of trails included in the trip' do
    it 'I also see the name, address and length for each trail' do

      trip_1 = Trip.create!(name: "Early August")
      trip_2 = Trip.create!(name: "Mid August")

      trail_1 = Trail.create!(name: "Mist Trail", address: "Mist Trail Road, Yosemite Valley", length: 7.5)
      trail_2 = Trail.create!(name: "4 Mile Trail", address: "4 Mile Trailhead, Yosemite Valley", length: 12.0)
      trail_3 = Trail.create!(name: "Mirror Lake Loop", address: "Mirror Lake, Yosemite Valley", length: 4.6)
      binding.pry
      TripTrail.create!(trip: trip_1, trail: trail_1)
      TripTrail.create!(trip: trip_1, trail: trail_2)
      TripTrail.create!(trip: trip_2, trail: trail_3)
      TripTrail.create!(trip: trip_2, trail: trail_1)

      visit '/trips'
      within './trip_2' do
        click_link "#{trip_2.name}"
      end

      expect(path).to eq("/trips/#{trip_2.id}")
      expect(page).to have_content("#{trail_1.name}")
      expect(page).to have_content("#{trail_1.address}")
      expect(page).to have_content("#{trail_1.length}")
      expect(page).to have_content("#{trail_2.name}")
      expect(page).to have_content("#{trail_2.address}")
      expect(page).to have_content("#{trail_2.length}")
    end
  end
end
