FactoryBot.define do
  factory :user do
    last_name { Faker::Lorem.characters(number:10) }
    first_name { Faker::Lorem.characters(number:10) }
    last_name_kana { Faker::Lorem.characters(number:10) }
    first_name_kana { Faker::Lorem.characters(number:10) }
    prefecture { Faker::Number.between(from: 1, to: 46) }
    screen_name { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    fav_noodle { Faker::Lorem.characters(number:10) }
    email {Faker::Internet.email}
    is_deleted { Faker::Boolean.boolean }
    password { Faker::Lorem.characters(number:10)}
  end
end
