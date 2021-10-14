FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    username { "testuser" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "testtest" }
  end
end