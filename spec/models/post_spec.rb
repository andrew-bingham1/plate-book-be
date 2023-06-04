require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:plate_posts) }
    it { should have_many(:plates).through(:plate_posts) }
    it { should have_many(:comments) }
  end

  describe "class methods" do
    before do
      test_data_posts
      @post_1 = @plate_1.posts.create!(title: "I have a pretty pony", body: "This is a test post", user_id: @user_1.id)
      @post_2 = @plate_2.posts.create!(title: "I think I'd like to have a dog", body: "This is a test post 2", user_id: @user_2.id)
      @post_3 = @plate_1.posts.create!(title: "Dogs are cool, but I think a pony would be even better.", body: "This is a test post 3", user_id: @user_1.id)
      @post_4 = @plate_2.posts.create!(title: "If you want a dog, here's why you're wrong.", body: "This is a test post 4", user_id: @user_2.id)
      @post_5 = @plate_1.posts.create!(title: "A pony, a squirrel, and a dog walk into a bar.", body: "This is a test post", user_id: @user_1.id)
      @post_6 = @plate_2.posts.create!(title: "I saw a pony today.", body: "This is a test post 2", user_id: @user_2.id)
      @post_7 = @plate_1.posts.create!(title: "What do you think? Pony? Dog?", body: "This is a test post 3", user_id: @user_1.id)
    end

    it "#search" do
      expect(Post.search("dog").sort).to eq([@post_2, @post_3, @post_4, @post_5, @post_7].sort)
      expect(Post.search("pony").sort).to eq([@post_1, @post_3, @post_5, @post_6, @post_7].sort)
      expect(Post.search("DOG").sort).to eq([@post_2, @post_3, @post_4, @post_5, @post_7].sort)
      expect(Post.search("PONY").sort).to eq([@post_1, @post_3, @post_5, @post_6, @post_7].sort)
    end
  end
end