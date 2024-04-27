FactoryBot.define do
  factory :discount do
    name { Faker::Commerce.product_name }
    category { Faker::Commerce.brand }
    description {Faker::Lorem.sentences(number: 3) }
    price_percent { 1 }
    amount { 10 }
  end
end
