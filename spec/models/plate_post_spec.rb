require 'rails_helper'

RSpec.describe PlatePost, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:plate_id) }
    it { should validate_presence_of(:post_id) }
  end

  describe 'associations' do
    it { should belong_to(:plate) }
    it { should belong_to(:post) }
  end
end