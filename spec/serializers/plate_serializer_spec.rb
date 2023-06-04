require 'rails_helper'

RSpec.describe PlateSerializer, type: :serializer do
  it 'can serialize a plate' do
    plate1 = Plate.create!(plate_number: '123-456')
    user1 = User.create!(username: 'user1', email: 'bucky@aol.com', uid: '1234', token: '1234')
    plate1.posts.create!(title: 'Test Post 1', body: 'Test Post 1 Body', user_id: user1.id)

    response = PlateSerializer.new(plate1).to_json
    plate = JSON.parse(response, symbolize_names: true)

    expect(plate).to have_key(:data)
    expect(plate[:data]).to have_key(:id)
    expect(plate[:data]).to have_key(:type)
    expect(plate[:data]).to have_key(:attributes)
    expect(plate[:data][:attributes]).to have_key(:plate_number)
    expect(plate[:data][:attributes][:plate_number]).to eq(plate1.plate_number)
    
    expect(plate[:data][:attributes]).to have_key(:posts)
    expect(plate[:data][:attributes][:posts][0]).to have_key(:id)
    expect(plate[:data][:attributes][:posts][0]).to have_key(:title)
    expect(plate[:data][:attributes][:posts][0]).to have_key(:created_at)
    expect(plate[:data][:attributes][:posts][0]).to have_key(:user_id)
    expect(plate[:data][:attributes][:posts][0]).to have_key(:comment_count)

  end
end