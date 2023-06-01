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
end