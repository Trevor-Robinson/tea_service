require 'rails_helper'
describe 'subscriptions' do
  it 'creates a subscription for a customer' do
      customer_id = create(:customer).id
      tea_id = create(:tea).id
      params = {"tea_id": "#{tea_id}", "status": true, "frequency": "2 weeks", "boxes": 3}
      post "/api/v1/customers/#{customer_id}/subscriptions", params: params
      subscription = Subscription.last

      expect(subscription[:customer_id]).to eq(customer_id)
      expect(subscription[:tea_id]).to eq(tea_id)
      expect(subscription[:status]).to be true
      expect(subscription[:frequency]).to eq("2 weeks")
      expect(subscription[:boxes]).to eq(3)
  end

  it 'updates the status of a subscription' do
    customer_with_tea_subscriptions
    customer = Customer.first
    subscription = Subscription.first
    current_status = subscription.status

    patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: {"status": false}

    expect(response).to be_successful
    subscription = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(subscription[:status]).to_not eq(current_status)

  end
  it "returns a customer's subscriptions by id" do
    customer_with_tea_subscriptions
    customer = Customer.first

    get "/api/v1/customers/#{customer.id}/subscriptions"

    expect(response).to be_successful
    subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

    subscriptions.each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_an(String)
      expect(subscription[:attributes]).to have_key(:tea_id)
      expect(subscription[:attributes][:tea_id]).to be_a(Integer)
      expect(subscription[:attributes]).to have_key(:status)
      expect(subscription[:attributes]).to have_key(:frequency)
      expect(subscription[:attributes][:frequency]).to be_a(String)
      expect(subscription[:attributes]).to have_key(:tea_name)
      expect(subscription[:attributes][:tea_name]).to be_a(String)
      expect(subscription[:attributes]).to have_key(:boxes)
      expect(subscription[:attributes][:boxes]).to be_a(Integer)
    end
  end
  it "returns an error if update request is sent for invalid subscriptions" do
    customer_with_tea_subscriptions
    customer = Customer.first

    patch "/api/v1/customers/#{customer.id}/subscriptions/99j", params: {"status": false}

    expect(response.status).to be(404)
    expect(response.body).to eq("Record Not Found")
  end
end
