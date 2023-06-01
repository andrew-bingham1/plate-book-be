require 'rails_helper'

RSpec.describe Plate, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:plate_number) }
    it { should validate_uniqueness_of(:plate_number) }
  end
  describe 'associations' do
    it { should have_many(:plate_posts) }
    it { should have_many(:posts).through(:plate_posts) }
  end
end