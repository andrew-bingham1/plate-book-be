require 'rails_helper'

RSpec.describe UserPlateSerializer, type: :serializer do
  it 'can serialize a user_plate' do
    user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
    plate1 = Plate.create!(plate_number: '123-456')
    user_plate1 = UserPlate.create!(user_id: user1.id, plate_id: plate1.id)

    response = UserPlateSerializer.new(user_plate1).to_json
    userplate = JSON.parse(response, symbolize_names: true)
    expect(userplate).to have_key(:data)
    expect(userplate[:data]).to have_key(:id)
    expect(userplate[:data]).to have_key(:type)
    expect(userplate[:data]).to have_key(:attributes)
    expect(userplate[:data][:attributes]).to have_key(:user_id)
    expect(userplate[:data][:attributes]).to have_key(:plate_id)
    expect(userplate[:data][:attributes]).to have_key(:id)
  end
end