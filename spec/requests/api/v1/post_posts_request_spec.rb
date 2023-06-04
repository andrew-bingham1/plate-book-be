require 'rails_helper'

RSpec.describe "Create Posts" do
  describe "create posts" do
    before do
      test_data_posts
    end

    it "successfully creates post, along with platepost and user post" do
      expect(Plate.all.count).to eq(2)
      expect(Post.all.count).to eq(4)
      expect(PlatePost.all.count).to eq(4)
      expect(@user_3.posts.length).to eq(0)
      expect(@plate_1.posts.length).to eq(2)

      post "/api/v1/posts", params: {
        params: {
          plate_number: @plate_1.plate_number,
          title: "Everyone is on their own journey.",
          body: "That said, the guy who drives this truck is an asshole.",
          photo_url: "http://fakeurlforplatebook.com/fakephoto",
          user_id: @user_3.id
        }
      }

      expect(response).to have_http_status(201)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:title]).to eq("Everyone is on their own journey.")

      @user_3.reload
      expect(@plate_1.posts.length).to eq(2)
      expect(@user_3.posts.length).to eq(1)
      expect(Plate.all.count).to eq(2)
      expect(Post.all.count).to eq(5)
      expect(PlatePost.all.count).to eq(5)
    end

    it "creates a new plate if unique plate name is entered" do
      expect(Plate.all.count).to eq(2)
      expect(Post.all.count).to eq(4)
      expect(PlatePost.all.count).to eq(4)
      expect(@user_2.posts.length).to eq(2)

      post "/api/v1/posts", params: {
        params: {
          plate_number: "GHI-9101",
          title: "Everyone is on their own journey.",
          body: "That said, the guy who drives this truck is an asshole.",
          photo_url: "http://fakeurlforplatebook.com/fakephoto",
          user_id: @user_2.id
        }
      }

      expect(response).to have_http_status(201)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:title]).to eq("Everyone is on their own journey.")

      @user_2.reload
      expect(@user_2.posts.length).to eq(3)
      expect(Plate.all.count).to eq(3)
      expect(Post.all.count).to eq(5)
      expect(PlatePost.all.count).to eq(5)
      expect(Plate.last.posts.length).to eq(1)
    end
  end

  describe "sad paths" do
    before do
      test_data_posts
    end

    it "nonexistent user" do
      post "/api/v1/posts", params: {
        params: {
          plate_number: "GHI-9101",
          title: "Everyone is on their own journey.",
          body: "That said, the guy who drives this truck is an asshole.",
          photo_url: "http://fakeurlforplatebook.com/fakephoto",
          id: 234234234234234
        }
      }

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:errors]).to eq("User not found")
    end
  end
end