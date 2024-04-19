FactoryBot.define do
  factory :purchase_order do
    description { "MyString" }
    date_time { "2024-04-18 22:02:48" }
    vendor { nil }
    item { nil }
    quantity { 1 }
    complete { 1 }
    user { nil }
  end
end
