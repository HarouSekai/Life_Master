FactoryBot.define do
  factory :image do
    image_explanation { Faker::Lorem.sentence }
    association :paragraph

    after(:build) do |image|
      image.paragraph = FactoryBot.create(:paragraph)
    end
  end
end
