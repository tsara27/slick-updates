FactoryGirl.define do
  factory :question do
    update_form
    sequence(:position)
    text { Faker::Lorem.sentence(3) }
  end
end
