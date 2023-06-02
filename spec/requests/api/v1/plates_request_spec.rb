require 'rails_helper'

RSpec.describe 'Plates API', type: :request do
  describe 'Index' do
    it 'sends a list of plates' do
      plate1 = Plate.create!(plate_number: 'ABC-123')
      plate2 = Plate.create!(plate_number: 'DEF-456')
      plate3 = Plate.create!(plate_number: 'GHI-789')

      get '/api/v1/plates'

      expect(response).to be_successful

      plates = JSON.parse(response.body, symbolize_names: true)
      plates = plates[:data]
  
      plates.each do |plate|
        expect(plate).to have_key(:id)
        expect(plate[:id]).to be_an(String)

        expect(plate).to have_key(:type)
        expect(plate[:type]).to eq('plate')

        expect(plate).to have_key(:attributes)
        expect(plate[:attributes]).to be_a(Hash)

        expect(plate[:attributes]).to have_key(:plate_number)
        expect(plate[:attributes][:plate_number]).to be_a(String)
      end
    end
  end

  describe 'Show' do
    it 'gets a single plate' do
      plate1 = Plate.create!(plate_number: 'ABC-123')

      get "/api/v1/plates/#{plate1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      plate = JSON.parse(response.body, symbolize_names: true)
      plate = plate[:data]

      expect(plate).to have_key(:id)
      expect(plate[:id]).to be_an(String)

      expect(plate).to have_key(:type)
      expect(plate[:type]).to eq('plate')

      expect(plate).to have_key(:attributes)
      expect(plate[:attributes]).to be_a(Hash)

      expect(plate[:attributes]).to have_key(:plate_number)
      expect(plate[:attributes][:plate_number]).to eq('ABC-123')
    end

    it 'returns a 404 if plate is not found' do
      get '/api/v1/plates/1'

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      expect(response.body).to eq('{"error":"Plate not found"}')
    end
  end
end