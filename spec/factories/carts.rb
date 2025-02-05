FactoryBot.define do
  factory :cart do
    order
    product
    quantity { Faker::Number.digit }
    value_in_cents { Faker::Number.between(from: 100, to: 1000) }
    ammount_in_cents { quantity * value_in_cents }
    status { "active" }
  end
end
