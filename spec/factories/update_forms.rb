FactoryGirl.define do
  factory :update_form do
    user
    token { Faker::Lorem.characters(24) }
    name { Faker::Lorem.sentence(3) }
  end
end
