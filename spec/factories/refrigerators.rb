FactoryBot.define do
  factory :refrigerator do
    cooking { Faker::Name.name }

    after(:build) do |menu|
      menu.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end