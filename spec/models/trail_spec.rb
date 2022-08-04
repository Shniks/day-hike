require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should have_many :trip_trails }
    it { should have_many(trips).through(:trip_trails) }
  end
end
