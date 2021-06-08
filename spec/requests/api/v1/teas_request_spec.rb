require 'rails_helper'
describe 'Teas API' do
  it "returns a list of teas" do
    create_list(:tea, 5)

    get '/api/v1/teas'

    expect(response).to be_successful
    teas = JSON.parse(response.body, symbolize_names: true)
    expect(teas.count).to eq(5)
    teas.each do |tea|
      expect(tea).to have_key(:id)
      expect(tea[:id]).to be_an(Integer)
      expect(tea).to have_key(:name)
      expect(tea[:name]).to be_a(String)
      expect(tea).to have_key(:description)
      expect(tea[:description]).to be_a(String)
      expect(tea).to have_key(:temperature)
      expect(tea[:temperature]).to be_a(String)
      expect(tea).to have_key(:brew_time)
      expect(tea[:brew_time]).to be_a(String)
      expect(tea).to have_key(:price)
      expect(tea[:price]).to be_a(Float)
    end
  end
end
