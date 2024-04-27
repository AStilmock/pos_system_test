FactoryBot.define do
  factory :sale do
    date_time { Date.today }
    shipping { 1.35 }
    taxes { 2.5 }
    sub_total_sale_price { 999 }
    total_sale_price { 1002.85 }
    complete { 1 }
    invoice_id { generate :invoice_id }
    discount_id { generate :discount_id }
    user_id { generate :user_id }
  end
end
