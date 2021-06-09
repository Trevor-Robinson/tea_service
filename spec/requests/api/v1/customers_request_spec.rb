require 'rails_helper'
describe 'customers' do
  it "returns a customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_successful
    customer = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(customer).to have_key(:id)
    expect(customer[:id]).to be_a(String)
    expect(customer[:attributes]).to have_key(:first_name)
    expect(customer[:attributes][:first_name]).to be_a(String)
    expect(customer[:attributes]).to have_key(:last_name)
    expect(customer[:attributes][:last_name]).to be_a(String)
    expect(customer[:attributes]).to have_key(:email)
    expect(customer[:attributes][:email]).to be_a(String)
    expect(customer[:attributes]).to have_key(:address)
    expect(customer[:attributes][:address]).to be_a(String)
  end
end
