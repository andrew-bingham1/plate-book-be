require 'rails_helper'

RSpec.describe PlateSerializer, type: :serializer do
  it 'can serialize a plate' do
    plate1 = Plate.create!(plate_number: '123-456')

    response = PlateSerializer.new(plate1).to_json
    plate = JSON.parse(response, symbolize_names: true)

    expect(plate).to have_key(:data)
    expect(plate[:data]).to have_key(:id)
    expect(plate[:data]).to have_key(:type)
    expect(plate[:data]).to have_key(:attributes)
    expect(plate[:data][:attributes]).to have_key(:plate_number)
  end
end