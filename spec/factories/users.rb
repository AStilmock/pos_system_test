FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password_digest { "test" }
    permission { 1 }
    discount_level { 1 }
  end
end
