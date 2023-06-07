require 'rails_helper'

RSpec.describe CommentSerializer, type: :serializer do
  it 'can serialize comments' do
    user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
    plate1 = Plate.create!(plate_number: '123-456')
    user_plate1 = UserPlate.create!(user_id: user1.id, plate_id: plate1.id)
    post = plate1.posts.create!(user_id: user1.id, title: 'test post', body: 'test body')
    comment1 = Comment.create!(user_id: user1.id, post_id: post.id, body: 'test comment')

    response = CommentSerializer.new(comment1).to_json
    comment = JSON.parse(response, symbolize_names: true)
    expect(comment).to have_key(:data)
    expect(comment[:data]).to have_key(:id)
    expect(comment[:data]).to have_key(:type)
    expect(comment[:data]).to have_key(:attributes)
    expect(comment[:data][:attributes]).to have_key(:user_id)
    expect(comment[:data][:attributes]).to have_key(:post_id)
    expect(comment[:data][:attributes]).to have_key(:body)
  end
end