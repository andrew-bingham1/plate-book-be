class Plate < ApplicationRecord
  has_many :plate_posts
  has_many :posts, through: :plate_posts

  validates :plate_number, presence: true, uniqueness: true

  before_save :remove_spaces

  def self.search(query)
    query = query.gsub(" ", "").upcase
    Plate.where("LOWER(plate_number) ILIKE ?", "%#{query}%")
  end

  def remove_spaces
    self.plate_number = self.plate_number.gsub(" ", "").upcase if self.plate_number
  end

end