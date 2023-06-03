require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  it 'can serialize a user' do
    user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
    plate1 = Plate.create!(plate_number: '123-456')
    user_plate1 = UserPlate.create!(user_id: user1.id, plate_id: plate1.id)
    post = plate1.posts.create!(user_id: user1.id, title: 'test post', body: 'test body')
    comment1 = Comment.create!(user_id: user1.id, post_id: post.id, body: 'test comment')

    response = UserSerializer.new(user1).to_json
    user = JSON.parse(response, symbolize_names: true)
   
   expect(user).to have_key(:data)

   expect(user[:data]).to have_key(:id)
   expect(user[:data]).to have_key(:type)

   expect(user[:data]).to have_key(:attributes)
   expect(user[:data][:attributes]).to have_key(:username)
   expect(user[:data][:attributes]).to have_key(:email)
   expect(user[:data][:attributes]).to have_key(:uid)
   expect(user[:data][:attributes]).to have_key(:token)
   expect(user[:data][:attributes]).to have_key(:comments)
   
   expect(user[:data]).to have_key(:relationships)
   expect(user[:data][:relationships]).to have_key(:plates)
   expect(user[:data][:relationships]).to have_key(:posts)
  end
end