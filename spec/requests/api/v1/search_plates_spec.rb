require 'rails_helper'

RSpec.describe "SearchController#index" do
  describe "happy paths" do
    before do 
      @plate_1 = Plate.create!(plate_number: "EEE 111")
      @plate_2 = Plate.create!(plate_number: "VEE 111")
      @plate_3 = Plate.create!(plate_number: "VVE 111")
      @plate_4 = Plate.create!(plate_number: "VVV 111")
      @plate_5 = Plate.create!(plate_number: "VVV 112")
      @plate_6 = Plate.create!(plate_number: "VVV 122")
      @plate_7 = Plate.create!(plate_number: "VVV 222")
      @plate_8 = Plate.create!(plate_number: "GRI 333")
    end

    it "partial match 1" do
      expected = [@plate_1.id, @plate_2.id, @plate_3.id]
      get "/api/v1/search", params: {
        category: "plates",
        query: "E"
      }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].count).to eq(3)
      json[:data].each do |plate|
        expect(expected.include?(plate[:id].to_i)).to eq(true)
      end
    end

    it "partial match 2" do
      expected = [@plate_4.id, @plate_5.id, @plate_6.id]
      get "/api/v1/search", params: {
        category: "plates",
        query: "VV1"
      }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].count).to eq(3)
      json[:data].each do |plate|
        expect(expected.include?(plate[:id].to_i)).to eq(true)
      end
    end

    it "partial match narrowing down" do
      searches = ["1", "11", "111", "E111", "EE111", "EEE111"]
      i = 6
      searches.each do |search|
        get "/api/v1/search", params: {
          category: "plates",
          query: search
        }
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data].count).to eq(i)
        i -= 1
      end
    end
  end

  describe "sad paths" do
    it "category does not exist" do
      get "/api/v1/search", params: {
        category: "samuel",
        query: "pony"
      }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(404)
      expect(json[:errors]).to eq("That category does not exist.")
    end

    it "empty results" do
      get "/api/v1/search", params: {
        category: "plates",
        query: "pony"
      }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data]).to eq([])
    end
  end
end