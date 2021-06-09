FactoryBot.define do
  factory :customer do
    first_name { Faker::Creature::Animal.name }
    last_name { Faker::Book.genre }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end
end
