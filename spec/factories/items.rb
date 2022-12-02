FactoryBot.define do
  factory :item do
    item_name       { Faker::Commerce.product_name }
    description     { Faker::Lorem.sentence }
    category_id     { Faker::Number.between(from: 2, to: 11) }
    condition_id    { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    ship_address_id { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
