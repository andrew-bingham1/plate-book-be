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

  describe "class methods" do
    describe "search" do
      before do 
        @plate_1 = Plate.create!(plate_number: "EEE 111")
        @plate_2 = Plate.create!(plate_number: "VEE 111")
        @plate_3 = Plate.create!(plate_number: "VVE 111")
        @plate_4 = Plate.create!(plate_number: "VVV 111")
        @plate_5 = Plate.create!(plate_number: "VVV 112")
        @plate_6 = Plate.create!(plate_number: "VVV 122")
        @plate_7 = Plate.create!(plate_number: "VVV 222")
        @plate_8 = Plate.create!(plate_number: "GRI 333")
      end
      
      it "partial match narrowing down" do
        searches = ["1", "11", "111", "E111", "EE111", "EEE111"]
        i = 6
        searches.each do |query|
          expect(Plate.search(query).length).to eq(i)
          i -= 1
        end
      end
      
      it "partial match 2" do
        expect(Plate.search("E").length).to eq(3)
      end
    end

    describe "hot plates" do
      before do 
        test_data_hot
      end

      it "returns top 5 hot plates by comments+posts" do
        expect(Plate.hot).to eq([@plate_7, @plate_2, @plate_9, @plate_5, @plate_6])
      end
    end
  end
end