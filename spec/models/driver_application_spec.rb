require 'rails_helper'

RSpec.describe DriverApplication, type: :model do
  describe 'association' do
    let(:driver_application) { FactoryGirl.create(:driver_application) }
    
    context 'user association' do
      it { should belong_to(:user) }

      it 'should return user' do
        expect(driver_application.user.class).to eq(User)
      end
    end

    context 'city association' do
      it { should belong_to(:city) }

      it 'should return city' do
        expect(driver_application.user.class).to eq(City)
      end
    end
  end

  describe 'driver_application validation' do
    context 'valid' do
      let(:driver_application) { FactoryGirl.build(:driver_application) } # generates a valid driver_application data
      
      it 'valid driver_application data' do
        expect(driver_application.valid?).to eq(true)
      end

      it { expect(driver_application.status).to eq('pending') }
    end
  end
end
