class PlatePost < ApplicationRecord
  belongs_to :plate
  belongs_to :post

  validates_presence_of :plate_id, :post_id

  has_one_attached :image
end