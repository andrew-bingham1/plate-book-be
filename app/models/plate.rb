class Plate < ApplicationRecord
  has_many :plate_posts
  has_many :posts, through: :plate_posts

  validates :plate_number, presence: true, uniqueness: true
end