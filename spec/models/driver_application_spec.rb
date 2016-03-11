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
  end
end
