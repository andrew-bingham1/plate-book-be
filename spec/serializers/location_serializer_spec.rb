require 'rails_helper'

RSpec.describe LocationSerializer, type: :serializer do
  it 'can serialize locations' do
    plate1 = Plate.create!(plate_number: '123-456')
    user1 = User.create!(username: 'user1', email: 'bucky@aol.com', uid: '1234', token: '1234')
    post1 = plate1.posts.create!(title: 'Test Post 1', body: 'Test Post 1 Body', user_id: user1.id, lat: 39.7392358, lng: -104.990251)

    response = LocationSerializer.new(post1).to_json
    location = JSON.parse(response, symbolize_names: true)

    expect(location).to have_key(:data)
    expect(location[:data]).to have_key(:id)
    expect(location[:data][:id]).to be_a(String)
    expect(location[:data]).to have_key(:type)
    expect(location[:data][:type]).to be_a(String) 
    expect(location[:data][:type]).to eq('location')
    expect(location[:data]).to have_key(:attributes)
    expect(location[:data][:attributes]).to be_a(Hash)
    expect(location[:data][:attributes]).to have_key(:lat)
    expect(location[:data][:attributes][:lat]).to be_a(Float)
    expect(location[:data][:attributes]).to have_key(:lng)
    expect(location[:data][:attributes][:lng]).to be_a(Float)
  end
    
end