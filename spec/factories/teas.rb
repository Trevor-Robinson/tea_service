FactoryBot.define do
  factory :tea do
    name { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    temperature { "185 F" }
    brew_time { "5 minutes" }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2)}
  end
end
