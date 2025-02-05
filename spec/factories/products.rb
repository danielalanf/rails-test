FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    value_in_cents { Faker::Number.number(digits: 4) }
  end

  factory :product_with_discount, traits: [ :with_discount ]

  trait :with_discount do
    discount { Faker::Number.digit }
  end
end
