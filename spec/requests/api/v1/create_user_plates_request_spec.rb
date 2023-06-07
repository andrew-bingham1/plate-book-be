require 'rails_helper'

RSpec.describe "User Plates Create" do
  describe "Happy Path" do
    before do
      test_data_posts
    end

    it "creates user_plate" do
      expect(UserPlate.all.count).to eq(0)
      expect(@user_1.user_plates).to eq([])
      expect(@user_1.plates).to eq([])

      post "/api/v1/user_plates", params: {
        params: {
        user_id: @user_1.id,
        plate_id: @plate_1.id
        }
      }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)

      expect(UserPlate.all.count).to eq(1)
      expect(@user_1.user_plates.count).to eq(1)
      @user_1.reload
      expect(@user_1.plates).to eq([@plate_1])
      expect(json[:message]).to eq("UserPlate successfully created")
    end
  end

  describe "Sad Path" do
    before do
      test_data_posts
    end

    it "nonexistent user" do
      post "/api/v1/user_plates", params: {
        params:{
          user_id: 98465765768,
          plate_id: @plate_1.id}
      }
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:errors].first).to eq("User must exist")
    end

    it "nonexistent plate" do
      post "/api/v1/user_plates", params: {
        params:{
          user_id: @user_1.id,
          plate_id: 32168498465
        }
      }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:errors].first).to eq("Plate must exist")
    end

    it "already exists" do
      @user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
      @plate1 = Plate.create!(plate_number: "EEE 111")
      @user_plate1 = UserPlate.create!(user_id: @user1.id, plate_id: @plate1.id)
      post "/api/v1/user_plates", params: {
        params:{
          user_id: @user1.id,
          plate_id: @plate1.id
        }
      }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:message]).to eq("Already Following")
    end
  end
end