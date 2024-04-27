FactoryBot.define do
  factory :purchase_order do
    description { Faker::Fantasy::Tolkien.location }
    date_time { Date.today }
    vendor_id { generate :vendor_id }
    item_id { generate :item_id }
    quantity { 10 }
    complete { 0 }
    user_id { generate :user_id }
  end
end
