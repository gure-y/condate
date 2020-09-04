class Menu < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_one_attached :image

  validates :title, presence: true

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
