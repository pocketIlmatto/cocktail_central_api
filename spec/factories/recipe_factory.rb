FactoryBot.define do

  factory :recipe do
    name Faker::Lorem.words(3).join(' ')
  end

end
