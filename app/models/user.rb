class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :user_plates
  has_many :plates, through: :user_plates

  validates :email, presence: true, uniqueness: true
end
