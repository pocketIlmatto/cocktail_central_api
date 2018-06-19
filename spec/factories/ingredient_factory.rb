FactoryBot.define do

  factory :ingredient do
    display_name Faker::Lorem.word
    name Faker::Lorem.word
  end

end
