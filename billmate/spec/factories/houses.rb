FactoryGirl.define do
  factory :house do
    name { Faker::Address.street_address }
  end
end