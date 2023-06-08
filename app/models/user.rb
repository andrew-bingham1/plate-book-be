class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :user_plates
  has_many :plates, through: :user_plates

  validates_presence_of :username
  validates_uniqueness_of :username
  validates :email, presence: true, uniqueness: true
end
