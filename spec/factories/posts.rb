FactoryBot.define do
  factory :post do
    title              { Faker::Lorem.words(number: 1) }
    post_status        { 1 }
    user_id              { Faker::Number.number(digits: 1)}
    order_id              { Faker::Number.number(digits: 1)}
  end
end
