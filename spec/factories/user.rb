FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    crypted_password { "testpassword9!" }
    permission { 1 }
    discount_level { 1 }
  end
end
