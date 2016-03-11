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
    context 'valid data' do
      let(:driver_application) { FactoryGirl.build(:driver_application) } # generates a valid driver_application data
      
      it 'valid driver_application data' do
        expect(driver_application.valid?).to eq(true)
      end

      it { expect(driver_application.status).to eq('pending') }
    end

    context 'invalid nil phone' do
      let(:driver_application) { FactoryGirl.build(:driver_application, phone: nil) }

      it 'should not be valid' do
        expect(driver_application.valid?).to eq(false)
      end

      it 'should have error on phone' do
        expect(driver_application).to  have(1).error_on(:phone)
      end
    end

    context 'invalid empty phone' do
      let(:driver_application) { FactoryGirl.build(:driver_application, phone: '') }

      it 'should not be valid' do
        expect(driver_application.valid?).to eq(false)
      end

      it 'should have error on phone' do
        expect(driver_application).to  have(1).error_on(:phone)
      end
    end

    context 'invalid status' do
      context 'nil status' do 
        let(:driver_application) { FactoryGirl.build(:driver_application, status: nil) }

        it 'status should not be nil' do
          expect(driver_application.valid?).to eq(false)
        end

        it 'should have error on status' do
          expect(driver_application).to  have(1).error_on(:status)
        end
      end

      context 'invalid string status' do 
        let(:driver_application) { FactoryGirl.build(:driver_application, status: 'some status') }

        it 'status should not be nil' do
          expect(driver_application.valid?).to eq(false)
        end

        it 'should have error on status' do
          expect(driver_application).to  have(1).error_on(:status)
        end
      end

      context 'invalid empty status' do 
        let(:driver_application) { FactoryGirl.build(:driver_application, status: '') }

        it 'status should not be nil' do
          expect(driver_application.valid?).to eq(false)
        end

        it 'should have error on status' do
          expect(driver_application).to  have(1).error_on(:status)
        end
      end
    end
  end

  describe '#accept' do
    let(:driver_application) { FactoryGirl.create(:driver_application) }
    
    context 'accept driver status' do
      it 'accept driver application from pending' do 
        expect{ 
          driver_application.accept
          }.to change{ driver_application }.from('pending').to('accepted')
      end
    end
  end

  describe '#reject' do
    let(:driver_application) { FactoryGirl.create(:driver_application) }
    
    context 'reject driver status' do
      it 'reject driver application from pending' do 
        expect{ 
          driver_application.accept
          }.to change{ driver_application }.from('pending').to('rejected')
      end
    end
  end


end
