FactoryBot.define do
  factory :item do
    name {Faker::Book.title}
    text {Faker::Lorem.sentence}
    price {3000}

    association :user

    category_id {2}
    condition_id {2}
    delivery_day_id {2}
    prefecture_id {2}
    delivery_fee_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
