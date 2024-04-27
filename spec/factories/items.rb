FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.brand }
    unit_price { 15 }
    item_cost { 5 }
    quantity { 2576 }
    in_stock { true }
    product_category_id { generate :product_category_id }
    discount_id { generate :discount_id }
    vendor_id { generate :vendor_id }
  end
end
