FactoryBot.define do
  factory :vendor do
    name { Faker::Commerce.vendor }
    description { Faker::Commerce.department }
    address { Faker::Address.full_address }
    email { "fakeemail@email.com" }
    phone { Faker::PhoneNumber.phone_number }
  end
end
