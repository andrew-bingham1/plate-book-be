require "rails_helper"

RSpec.describe "Destroy UserPlates" do
  describe "Happy Paths" do
    before do
      test_data_posts
      @user_1.user_plates.create!(plate_id: @plate_1.id)
      @user_1.user_plates.create!(plate_id: @plate_2.id)
    end
    it "destroys user_plate" do
      expect(@user_1.user_plates.count).to eq(2)
      expect(@user_1.plates.sort).to eq([@plate_1, @plate_2].sort)

      delete "/api/v1/user_plates/#{@plate_2.id}", params: {user_id: @user_1.id}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(204)
      expect(response.body).to eq("")

      @user_1.reload
      expect(@user_1.user_plates.count).to eq(1)
      expect(@user_1.plates.sort).to eq(@plate_1)
    end
  end
end