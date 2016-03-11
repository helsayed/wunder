FactoryGirl.define do
  factory :city, class: 'Cities' do
    name Faker::Address.city
  end
end
