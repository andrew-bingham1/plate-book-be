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

  def self.hot
    Plate.select('plates.*, COUNT(DISTINCT posts.id) + COUNT(DISTINCT comments.id) AS total_count')
      .joins(:posts).joins('LEFT JOIN comments ON posts.id = comments.post_id')
      .group('plates.id')
      .order('total_count DESC').limit(5)
  end

end