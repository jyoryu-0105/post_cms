FactoryBot.define do
  factory :order do
    title              { Faker::Lorem.words(number: 1) }
    first_keyword      { Faker::Lorem.words(number: 1) }
    second_keyword     { Faker::Lorem.words(number: 1) }
    third_keyword      { Faker::Lorem.words(number: 1) }
    fourth_keyword     { Faker::Lorem.words(number: 1) }
    fifth_keyword      { Faker::Lorem.words(number: 1) }
    words              { Faker::Number.number(digits: 5)}
    price              { Faker::Number.number(digits: 5)}
  end
end
