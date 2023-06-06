require 'rails_helper'

RSpec.describe "Hot Plates" do
  before do
    test_data_hot
  end
  it "returns top 5 plates by activity" do
    get "/api/v1/search/hot_plates"
    plates = JSON.parse(response.body, symbolize_names: true)

    expect(plates).to be_a(Hash)
    expect(plates[:data].count).to eq(5)
    expect(plates[:data]).to all(have_key(:type))
    plates[:data].each do |plate|
      expect(plate[:type]).to eq("plate")
    end
  end
end