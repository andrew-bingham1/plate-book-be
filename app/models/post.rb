class Post < ApplicationRecord  
  belongs_to :user
  has_many :plate_posts
  has_many :plates, through: :plate_posts
  has_many :comments

  validates_presence_of :user_id, :title, :body

  def self.search(query)
    Post.where("title ILIKE ?", "%#{query}%")
  end

  def self.search_with_emotion(params)
    Post.where("title ILIKE ?", "%#{params[:query]}%").where("selected_tags ILIKE ?", "%#{params[:emotion]}%")
  end
end