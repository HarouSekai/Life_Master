FactoryBot.define do
  factory :avatar do
    association :user

    after(:build) do |avatar|
      avatar.avatar.attach(io: File.open('public/test_avatar.svg'), filename: 'test_avatar.svg')
      avatar.user = FactoryBot.create(:user)
    end
  end
end
