FactoryBot.define do
  factory :user do
    username { "testuser" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "testtest" }
  end
end