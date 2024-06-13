FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'a1' + Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) }
    password_confirmation { password }
  end
end
