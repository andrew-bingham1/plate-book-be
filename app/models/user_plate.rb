class UserPlate < ApplicationRecord
  belongs_to :user
  belongs_to :plate

  validates_presence_of :user_id, :plate_id
end