require "rails_helper"

RSpec.describe "Get all locations" do
  it "returns all locations" do
    plate1 = Plate.create!(plate_number: '123-456')
    user1 = User.create!(username: 'user1', email: 'bucky@aol.com', uid: '1234', token: '1234')
    post1 = plate1.posts.create!(title: 'Test Post 1', body: 'Test Post 1 Body', user_id: user1.id, lat: 39.7392358, lng: -104.990251)
    post2 = plate1.posts.create!(title: 'Test Post 2', body: 'Test Post 2 Body', user_id: user1.id, lat: 37.7392358, lng: -103.990251)

    get "/api/v1/locations"

    expect(response).to be_successful

    locations = JSON.parse(response.body, symbolize_names: true)
    locations = locations[:data]

    locations.each do |location|
      expect(location).to have_key(:id)
      expect(location[:id]).to be_an(String)
      
      expect(location).to have_key(:type)
      expect(location[:type]).to eq('location')

      expect(location).to have_key(:attributes)
      expect(location[:attributes]).to be_a(Hash)
      expect(location[:attributes]).to have_key(:lat)
      expect(location[:attributes][:lat]).to be_a(Float)
      expect(location[:attributes]).to have_key(:lng)
      expect(location[:attributes][:lng]).to be_a(Float)
    end
  end
end