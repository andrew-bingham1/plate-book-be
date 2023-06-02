require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  describe 'Index' do
    it 'gets a list of Posts' do
      user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345') 

      post1 = Post.create!(user_id: user1.id, title: 'testpost1', body: 'testbody1')
      post2 = Post.create!(user_id: user1.id, title: 'testpost2', body: 'testbody2')
      post3 = Post.create!(user_id: user1.id, title: 'testpost3', body: 'testbody3')

      get '/api/v1/posts'

      expect(response).to be_successful

      posts = JSON.parse(response.body, symbolize_names: true)
      posts = posts[:data]

      expect(posts.count).to eq(3)

      posts.each do |post|
        expect(post).to have_key(:id)
        expect(post[:id]).to be_an(String)

        expect(post).to have_key(:type)
        expect(post[:type]).to eq('post')

        expect(post).to have_key(:attributes)
        expect(post[:attributes]).to be_a(Hash)

        expect(post[:attributes]).to have_key(:user_id)
        expect(post[:attributes][:user_id]).to be_an(Integer)

        expect(post[:attributes]).to have_key(:title)
        expect(post[:attributes][:title]).to be_a(String)

        expect(post[:attributes]).to have_key(:body)
        expect(post[:attributes][:body]).to be_a(String)

        expect(post[:attributes]).to have_key(:comments)
        expect(post[:attributes][:comments]).to be_an(Array)
      end
    end
  end

  describe 'Show' do
    it 'gets a single Post' do
      user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345') 

      post1 = Post.create!(user_id: user1.id, title: 'testpost1', body: 'testbody1')

      comment1 = Comment.create!(user_id: user1.id, post_id: post1.id, body: 'testcomment1')
      comment2 = Comment.create!(user_id: user1.id, post_id: post1.id, body: 'testcomment2')
      comment3 = Comment.create!(user_id: user1.id, post_id: post1.id, body: 'testcomment3')

      get "/api/v1/posts/#{post1.id}"

      expect(response).to be_successful

      post = JSON.parse(response.body, symbolize_names: true)
      post = post[:data][:attributes]

      expect(post).to have_key(:user_id)
      expect(post[:user_id]).to eq(user1.id)
      
      expect(post).to have_key(:title)
      expect(post[:title]).to eq('testpost1')

      expect(post).to have_key(:body)
      expect(post[:body]).to eq('testbody1')

      expect(post).to have_key(:comments)
      expect(post[:comments]).to be_an(Array)
      expect(post[:comments].count).to eq(3)

      expect(post[:comments][0][:body]).to eq('testcomment1')
    end

    it 'returns an error if the Post does not exist' do
      get '/api/v1/posts/1'

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      expect(response.body).to eq('{"error":"Post not found"}')
    end
  end
end