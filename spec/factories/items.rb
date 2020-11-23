FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 3) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    explanation      { Faker::Lorem.sentence }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    postage_id       { Faker::Number.between(from: 2, to: 3) }
    prepare_id       { Faker::Number.between(from: 2, to: 4) }
    condition_id     { Faker::Number.between(from: 2, to: 7) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
