FactoryBot.define do
  factory :user do
    username { "username" }
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
