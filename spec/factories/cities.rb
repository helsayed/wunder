FactoryGirl.define do
  factory :user do
    name Faker::Address.city
  end
end
