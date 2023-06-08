require 'rails_helper'

RSpec.describe "Update username" do
  describe "Happy Path" do
    before do
      test_data_hot
    end

    it "updates username" do
      expect(@user_1.username).to eq("User 1")
      put "/api/v1/users/#{@user_1.id}", params: {id: @user_1.id, username: "Flibbety Gibbet"}
      @user_1.reload
      expect(@user_1.username).to eq("Flibbety Gibbet")
    end

    it "renders proper json" do
      put "/api/v1/users/#{@user_1.id}", params: {id: @user_1.id, username: "Flibbety Gibbet"}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data][:type]).to eq("user")
    end
  end

  describe "Sad Path" do
    before do 
      test_data_hot
    end

    it "nonexistent user" do
      put "/api/v1/users/984657684654", params: {id: @user_1.id, username: "Flibbety Gibbet"}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(404)
      expect(json[:error]).to eq("User not found")
    end

    it "username already exists" do
      put "/api/v1/users/#{@user_1.id}", params: {id: @user_1.id, username: "User 2"}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(422)
      expect(json[:errors]).to eq("Username already taken")
    end

    it "something else went wrong" do
      put "/api/v1/users/#{@user_1.id}", params: {id: @user_1.id, username: ""}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:errors]).to eq("Something went wrong.")
    end
  end
end