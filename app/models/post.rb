class Post < ApplicationRecord  
  belongs_to :user
  has_many :plate_posts
  has_many :plates, through: :plate_posts
  has_many :comments

  validates_presence_of :user_id, :title, :body

  def self.search(query)
    Post.where("title ILIKE ?", "%#{query}%")
  end
end