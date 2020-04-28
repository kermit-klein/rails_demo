FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :username do |n|
    "username#{n}"
  end
  factory :user do
    username { generate :username }
    email { generate :email }
    password { "password123" }
  end
end
