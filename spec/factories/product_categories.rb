FactoryBot.define do
  factory :product_category do
    name { Faker::Commerce.product_name }
    description {Faker::Lorem.sentences(number: 3) }
  end
end
