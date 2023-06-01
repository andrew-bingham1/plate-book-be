require 'rails_helper'

RSpec.describe UserPlate, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:plate_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:plate) }
  end
end