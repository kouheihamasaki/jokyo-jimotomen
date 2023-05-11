FactoryBot.define do
  factory :post do
    user
    user_id { Faker::Number.between(from: 1, to: 10) }
    shop_name { Faker::Lorem.characters(number:10) }
    star { Faker::Number.between(from: 1, to: 5) }
    adress { Faker::Lorem.characters(number:10) }
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:30) }
    image { Faker::LoremPixel.image(size: "400x400") }
  end
end