FactoryGirl.define do
  factory :roommate do
    house
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
