FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    summary { Faker::Lorem.paragraph }

    association :user

    after(:build) do |article|
      article.user = FactoryBot.create(:user)
    end
  end
end
