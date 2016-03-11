require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validation' do
    context 'valid' do
      let(:user) { FactoryGirl.build(:user) } # generates a valid user data
      
      it 'valid user data' do
        expect(user.valid?).to eq(true)
      end
    end

    context 'invalid first_name' do
      let(:user) { FactoryGirl.build(:user, first_name: nil) }

      it 'should not be valid' do
        expect(user.valid?).to eq(false)
      end

      it 'should have error on first_name' do
        expect(user).to  have(1).error_on(:first_name)
      end
    end

    context 'invalid last_name' do
      let(:user) { FactoryGirl.build(:user, last_name: nil) }

      it 'should not be valid' do
        expect(user.valid?).to eq(false)
      end

      it 'should have error on last_name' do
        expect(user).to  have(1).error_on(:last_name)
      end
    end

    context 'invalid email' do
      let(:user) { FactoryGirl.build(:user, email: nil) }

      it 'should not be valid' do
        expect(user.valid?).to eq(false)
      end

      it 'should have error on email' do
        expect(user).to  have(1).error_on(:email)
      end
    end
  end
end
