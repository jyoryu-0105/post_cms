FactoryBot.define do
  factory :apply do
    user_id              { Faker::Number.number(digits: 1)}
    order_id              { Faker::Number.number(digits: 1)}
  end
end
