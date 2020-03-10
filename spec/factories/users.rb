FactoryBot.define do
  factory :user do
    name { "MyString" }
    username { "MyString" }
    website { "MyString" }
    bio { "MyText" }
    email { "MyString" }
    phone_number { "MyString" }
    gender { "MyString" }
    password_digest { "MyString" }
  end
end
