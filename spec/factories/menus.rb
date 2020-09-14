FactoryBot.define do
  factory :menu do
    title { Faker::Name.name }
    association :user

    after(:build) do |menu|
      menu.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end