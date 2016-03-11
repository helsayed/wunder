require 'rails_helper'

RSpec.describe Cities, type: :model do
  describe 'city validation' do
    context 'valid' do
      let(:city) { FactoryGirl.build(:city) } # generates a valid city data
      
      it 'valid user data' do
        expect(city.valid?).to eq(true)
      end
    end

    context 'invalid nil city name' do
      let(:city) { FactoryGirl.build(:city, name: nil) }

      it 'should not be valid' do
        expect(city.valid?).to eq(false)
      end

      it 'should have error on name' do
        expect(city).to  have(1).error_on(:name)
      end
    end
  end
end
