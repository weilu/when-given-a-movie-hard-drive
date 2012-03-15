FactoryGirl.define do
  factory :movie do
    name {Faker::Lorem.words}
    year 2000
    rating 9.0
  end
end