require 'rails_helper'
describe 'customers' do
  it "returns a customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_successful
    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer[:id]).to be_an(Integer)
    expect(customer).to have_key(:first_name)
    expect(customer[:first_name]).to be_a(String)
    expect(customer).to have_key(:last_name)
    expect(customer[:last_name]).to be_a(String)
    expect(customer).to have_key(:email)
    expect(customer[:email]).to be_a(String)
    expect(customer).to have_key(:address)
    expect(customer[:address]).to be_a(String)
  end
end
