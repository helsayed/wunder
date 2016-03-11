require 'rails_helper'

RSpec.describe Cities, type: :model do
  describe 'city validation' do
    context 'valid' do
      let(:city) { FactoryGirl.build(:city) } # generates a valid city data
      
      it 'valid user data' do
        expect(city.valid?).to eq(true)
      end
    end

end
