FactoryBot.define do
  factory :paragraph do
    headline { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    association :article

    after(:build) do |paragraph|
      paragraph.article = FactoryBot.create(:article)
    end
  end
end
