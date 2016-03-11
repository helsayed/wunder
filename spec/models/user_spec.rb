require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'first_name validation' do
    context 'with valid first_name' do
      let(:user) { FactoryGirl.build(:user) } # generates a valid user data
      
      it 'valid user data' do
        expect(user.valid?).to eq(true)
      end
    end
  end
end
