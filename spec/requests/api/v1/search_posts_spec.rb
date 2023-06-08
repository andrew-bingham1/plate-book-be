require 'rails_helper'

RSpec.describe "SearchController#index" do
  describe "happy paths" do
    before do 
      test_data_posts
      @post_1 = @plate_1.posts.create!(title: "I have a pretty pony", body: "This is a test post", user_id: @user_1.id)
      @post_2 = @plate_2.posts.create!(title: "I think I'd like to have a dog", body: "This is a test post 2", user_id: @user_2.id)
      @post_3 = @plate_1.posts.create!(title: "Dogs are cool, but I think a pony would be even better.", body: "This is a test post 3", user_id: @user_1.id)
      @post_4 = @plate_2.posts.create!(title: "If you want a dog, here's why you're wrong.", body: "This is a test post 4", user_id: @user_2.id)
      @post_5 = @plate_1.posts.create!(title: "A pony, a squirrel, and a dog walk into a bar.", body: "This is a test post", user_id: @user_1.id)
      @post_6 = @plate_2.posts.create!(title: "I saw a pony today.", body: "This is a test post 2", user_id: @user_2.id)
      @post_7 = @plate_1.posts.create!(title: "What do you think? Pony? Dog?", body: "This is a test post 3", user_id: @user_1.id)
      @post_8 = @plate_2.posts.create!(title: "Part 5: The pony was a phony.", body: "This is a test post 4", user_id: @user_2.id)
    end

    it "search by name" do
      get "/api/v1/search", params: {
        category: "posts",
        query: "pony",
        emotion: "None"
      }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].first[:id].to_i).to eq(@post_1.id)

      get "/api/v1/search", params: {
        category: "posts",
        query: "dog",
        emotion: "None"
      }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].first[:id].to_i).to eq(@post_2.id)
    end

    it "can search by emotion" do
      @post_9 = @plate_2.posts.create!(title: "Part 5: The pony was a phony.", body: "This is a test post 4", user_id: @user_2.id, selected_tags: "Anger")
      get "/api/v1/search", params: {
        category: "posts",
        query: "pony",
        emotion: "Anger"
      }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].first[:id].to_i).to eq(@post_9.id)
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
  end
end