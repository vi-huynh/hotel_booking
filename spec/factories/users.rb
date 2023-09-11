FactoryBot.define do
  factory :user do
    username { "username" }
    email { "email@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
