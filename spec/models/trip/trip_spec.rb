require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :trip_trails }
    it { should have_many(:trails).through(:trip_trails) }
  end

  describe 'calculations' do
    before do
      @trip = Trip.create!(name: "Early August")

      trail_1 = Trail.create!(name: "Mist Trail", address: "Mist Trail Road, Yosemite Valley", length: 7.5)
      trail_2 = Trail.create!(name: "4 Mile Trail", address: "4 Mile Trailhead, Yosemite Valley", length: 12.0)

      TripTrail.create!(trip: @trip, trail: trail_1)
      TripTrail.create!(trip: @trip, trail: trail_2)
    end

    it 'can find the total hiking distance' do
      expect(@trip.total_hiking_distance).to eq(19.5)
    end

    it 'can find the average hiking distance' do
      expect(@trip.average_hiking_distance).to eq(0.975e1)
    end
  end

end
