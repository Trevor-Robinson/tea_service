require 'rails_helper'
describe 'Teas API' do
  it "returns a list of teas" do
    create_list(:tea, 5)

    get 'api/v1/teas'

    expect(response).to be_successful
  end
end
