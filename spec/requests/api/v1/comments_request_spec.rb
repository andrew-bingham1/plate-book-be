require 'rails_helper'

RSpec.describe 'Comments API', type: :request do
  describe 'Create' do
    it 'creates a comment' do
      plate1 = Plate.create!(plate_number: 'testplate1')
      user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
      user_plate1 = UserPlate.create!(user_id: user1.id, plate_id: plate1.id)

      post1 = Post.create!(user_id: user1.id, title: 'testpost1', body: 'testbody1')
      plate_post1 = PlatePost.create!(plate_id: plate1.id, post_id: post1.id)
      
      post "/api/v1/posts/#{post1.id}/comments", params: {body: 'This is a test comment!', user_id: user1.id, post_id: post1.id}
      
      expect(response).to be_successful
      
      comments = JSON.parse(response.body, symbolize_names: true)
      comment= comments[:data]
      expect(comment).to have_key(:id)
      expect(comment).to have_key(:type)
      expect(comment).to have_key(:attributes)
      expect(comment[:attributes]).to have_key(:body)
      expect(comment[:attributes][:body]).to eq('This is a test comment!')
      expect(comment[:attributes]).to have_key(:user_id)
      expect(comment[:attributes][:user_id]).to eq(user1.id)
      expect(comment[:attributes]).to have_key(:post_id)
      expect(comment[:attributes][:post_id]).to eq(post1.id)
    end
      
  end
end