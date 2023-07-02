FactoryBot.define do
  Faker::Config.locale = 'ja'
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
  end
end
