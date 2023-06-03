require 'rails_helper'

RSpec.describe PostSerializer, type: :serializer do
  it 'can serialize a post' do
    user1 = User.create!(username: 'testuser1', email: 'joebob@gmail.com', uid: '12345', token: '12345')
    plate1 = Plate.create!(plate_number: '123-456')
    user_plate1 = UserPlate.create!(user_id: user1.id, plate_id: plate1.id)
    post = plate1.posts.create!(user_id: user1.id, title: 'test post', body: 'test body')
    comment1 = Comment.create!(user_id: user1.id, post_id: post.id, body: 'test comment')

    response = PostSerializer.new(post).to_json
    post = JSON.parse(response, symbolize_names: true)

    expect(post).to have_key(:data)

    expect(post[:data]).to have_key(:id)
    expect(post[:data]).to have_key(:type)
    expect(post[:data]).to have_key(:attributes)

    expect(post[:data][:attributes]).to have_key(:title)
    expect(post[:data][:attributes]).to have_key(:body)
    expect(post[:data][:attributes]).to have_key(:user_id)
    expect(post[:data][:attributes]).to have_key(:plate_posts)
    expect(post[:data][:attributes]).to have_key(:comments)
    expect(post[:data][:attributes]).to have_key(:parent_plates)
  end
end