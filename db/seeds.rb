# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = FactoryBot.create(:customer)
FactoryBot.create_list(:tea, 5) do |tea|
  FactoryBot.create(:subscription, customer: customer, tea: tea)
end
customer2 = FactoryBot.create(:customer)
FactoryBot.create_list(:tea, 5) do |tea|
  FactoryBot.create(:subscription, customer: customer2, tea: tea)
end
customer3 = FactoryBot.create(:customer)
FactoryBot.create_list(:tea, 5) do |tea|
  FactoryBot.create(:subscription, customer: customer3, tea: tea)
end
customer4 = FactoryBot.create(:customer)
FactoryBot.create_list(:tea, 5) do |tea|
  FactoryBot.create(:subscription, customer: customer4, tea: tea)
end
customer5 = FactoryBot.create(:customer)
FactoryBot.create_list(:tea, 5) do |tea|
  FactoryBot.create(:subscription, customer: customer5, tea: tea)
end
