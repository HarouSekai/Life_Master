FactoryBot.define do
  factory :image do
    image_explanation { Faker::Lorem.sentence }
    association :paragraph

    after(:build) do |image|
      image.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
      image.paragraph = FactoryBot.create(:paragraph)
    end
  end
end
