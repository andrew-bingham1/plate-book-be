class Plate < ApplicationRecord
  has_many :plate_posts
  has_many :posts, through: :plate_posts

  validates :plate_number, presence: true, uniqueness: true

  def self.search(query)
    query = query.gsub(" ", "").upcase
    Plate.where("LOWER(plate_number) ILIKE ?", "%#{query}%")
  end
end