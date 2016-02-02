FactoryGirl.define do
  factory :user do
    email { "#{Faker::Name.first_name}@gmail.com".downcase }
    uid { Faker::Number.number(21) }
  end
end
