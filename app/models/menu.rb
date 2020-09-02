class Menu < ApplicationRecord
  belongs_to :user
  has_many :bookmark

  validates :title, presence: true
end
