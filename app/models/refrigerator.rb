class Refrigerator < ApplicationRecord
  has_one_attached :image

  validates :cooking, presence: true
  validates :image, presence: true
end
