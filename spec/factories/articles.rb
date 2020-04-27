FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    # user factory: :user, username:"avsdf", email:"sdfsdfq@gmail.com", password:"23543524"
    association :user
  end
end
