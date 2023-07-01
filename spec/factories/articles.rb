FactoryBot.define do
  factory :article do
    title { "MyString" }
    summary { "MyText" }

    association :user

    after(:build) do |article|
      article.user = FactoryBot.create(:user)
    end
  end
end
