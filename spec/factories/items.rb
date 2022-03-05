FactoryBot.define do
  factory :item do
    name { Faker::Games::Pokemon.name }
    text { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 15) }
    price { Faker::Number.between(from: 220, to: 750) }
    stock { Faker::Number.between(from: 2, to: 12) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_item.webp'), filename: 'test_item.webp')
    end
  end
end
