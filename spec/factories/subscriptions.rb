FactoryBot.define do
  factory :subscription do
    customer { nil }
    tea { nil }
    status { true}
    frequency { "MyString" }
    boxes { Faker::Number.within(range: 1..10) }
  end
end
def customer_with_tea_subscriptions
  customer = FactoryBot.create(:customer)
  FactoryBot.create_list(:tea, 5) do |tea|
    FactoryBot.create(:subscription, customer: customer, tea: tea)
  end
end
