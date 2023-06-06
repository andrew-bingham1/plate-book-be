require 'rails_helper'

RSpec.describe "Hot Plates" do
  before do
    test_data_hot
  end
  it "returns top 5 plates by activity" do
    get "/api/v1/plates"
    require 'pry'; binding.pry
  end
end