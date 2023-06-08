require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'Index' do
    it 'gets a list of Users' do
      user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
      user2 = User.create!(username: 'testuser2', email: 'somethingwild@yahoo.com', uid: '67890', token: '67890')
      user3 = User.create!(username: 'testuser3', email: 'bahbahblacksheep@aol.com', uid: 'abcde', token: 'abcde')

      get '/api/v1/users'

      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)
      users = users[:data]

      expect(users.count).to eq(3)

      users.each do |user|
        expect(user).to have_key(:id)
        expect(user[:id]).to be_an(String)

        expect(user).to have_key(:type)
        expect(user[:type]).to eq('user')

        expect(user).to have_key(:attributes)
        expect(user[:attributes]).to be_a(Hash)

        expect(user[:attributes]).to have_key(:username)
        expect(user[:attributes][:username]).to be_a(String)

        expect(user[:attributes]).to have_key(:email)
        expect(user[:attributes][:email]).to be_a(String)

        expect(user[:attributes]).to have_key(:uid)
        expect(user[:attributes][:uid]).to be_a(String)

        expect(user[:attributes]).to have_key(:token)
        expect(user[:attributes][:token]).to be_a(String)
      end
    end
  end

  describe 'Show' do
    it 'gets a single User' do
      user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
      post1 = Post.create!(user_id: user1.id, title: 'testpost1', body: 'testbody1')
      comment1 = Comment.create!(user_id: user1.id, post_id: post1.id, body: 'testcomment1')

      get "/api/v1/users/#{user1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      user = JSON.parse(response.body, symbolize_names: true)
      user = user[:data]

      expect(user[:id]).to eq(user1.id.to_s)
      expect(user[:type]).to eq('user')

      expect(user[:attributes][:username]).to eq(user1.username)

      expect(user[:attributes][:email]).to eq(user1.email)

      expect(user[:attributes][:uid]).to eq(user1.uid)

      expect(user[:attributes][:token]).to eq(user1.token)

      expect(user[:attributes][:comments]).to eq([{id: comment1.id, body: comment1.body, post_id: comment1.post_id}])
# require 'pry'; binding.pry
      expect(user[:attributes][:posts]).to eq([{id: post1.id, title: 'testpost1'}])
      expect(user[:attributes][:plates]).to eq([])
    end

    it 'returns a 404 if the User does not exist' do
      get '/api/v1/users/1'

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(response.body).to eq('{"errors":"User not found"}')
    end
  end

  describe "Create" do
    it "happy path" do
      user_params = {
        :email => "test@gmail.com",
        :token => "sdfsdf",
        :uid => "1234523423",
      }

      post "/api/v1/users", params: user_params
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json[:data][:attributes][:email]).to eq(user_params[:email])
      expect(json[:data][:attributes][:token]).to eq(user_params[:token])
      expect(json[:data][:attributes][:uid]).to eq(user_params[:uid])
      expect(json[:data][:attributes][:username]).to eq(user_params[:uid])
    end

    it "sad path" do

    end
  end
end

