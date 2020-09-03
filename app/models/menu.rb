class Menu < ApplicationRecord
  belongs_to :user
  has_many :bookmark
  has_one_attached :image

  validates :title, presence: true
end
