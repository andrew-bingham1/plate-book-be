require 'rails_helper'

RSpec.describe 'User Plate API', type: :request do
  before :each do
    @user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
    @user2 = User.create!(username: 'testuser2', email: 'somethingwild@yahoo.com', uid: '67890', token: '67890')
    @user3 = User.create!(username: 'testuser3', email: 'bahbahblacksheep@aol.com', uid: 'abcde', token: 'abcde')
    @plate1 = Plate.create!(plate_number: "EEE 111")
    @plate2 = Plate.create!(plate_number: "VEE 111")
    @plate3 = Plate.create!(plate_number: "VVE 111")
    @user_plate1 = UserPlate.create!(user_id: @user1.id, plate_id: @plate1.id)
    @user_plate2 = UserPlate.create!(user_id: @user2.id, plate_id: @plate2.id)
  end
  describe 'Show' do
    it "happy path, returns a user's plates" do
      params = {params:{user_id: @user1.id, plate_id: @plate1.id}}
      get '/api/v1/userplate', params: params
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:data][:id]).to eq(@user_plate1.id.to_s)
      expect(json[:data][:type]).to eq('user_plate')
      expect(json[:data][:attributes][:user_id]).to eq(@user1.id)
      expect(json[:data][:attributes][:plate_id]).to eq(@plate1.id)
    end

    it "sad path, returns an error if user_plate doesn't exist" do
      params = {params:{user_id: 9999, plate_id: @plate1.id}}
      get '/api/v1/userplate', params: params
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(json[:errors]).to eq("Not found")
    end
  end
end