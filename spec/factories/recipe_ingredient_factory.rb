FactoryBot.define do

  factory :recipe_ingredient do
    association :ingredient
    association :recipe

    qty { rand(0.0..100.0).round }
    uom ['cup', 'oz', 'tsp'].sample
  end

end
