class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :user_plates
  has_many :plates, through: :user_plates

  # validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end