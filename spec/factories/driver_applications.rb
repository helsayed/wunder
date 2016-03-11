FactoryGirl.define do
  factory :driver_application do
    association :user, factory: :user
    phone Faker::PhoneNumber.phone_number
    association :city, factory: :city
  end
end
