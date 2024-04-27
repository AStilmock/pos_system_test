FactoryBot.define do
  factory :invoice do
    date_time { Date.today } 
    quantity { 99 }
    sub_total_sale_price { 999 }
    total_sale_price { 1002.85 }
    complete { 1 }
    user_id { generate :user_id }
    item_id { generate :item_id }
    discount_id { generate :discount_id }
  end
end
