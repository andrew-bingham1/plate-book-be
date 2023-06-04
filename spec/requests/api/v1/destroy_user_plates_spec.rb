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
      expect(response).to have_http_status(204)
      expect(response.body).to eq("")

      @user_1.reload
      expect(@user_1.user_plates.count).to eq(1)
      expect(@user_1.plates.sort).to eq([@plate_1])
    end
  end

  describe "Sad Paths" do
    before do
      test_data_posts
      @user_1.user_plates.create!(plate_id: @plate_1.id)
      @user_1.user_plates.create!(plate_id: @plate_2.id)
    end

    it "nonexistent user" do
      delete "/api/v1/user_plates/#{@plate_2.id}", params: {user_id: 234234234234234}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(404)
      expect(json[:errors]).to eq("Not found")
    end

    it "nonexistent plate" do
      delete "/api/v1/user_plates/654654654654", params: {user_id: @user_1.id}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(404)
      expect(json[:errors]).to eq("Not found")
    end
  end
end