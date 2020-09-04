class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_menus, through: :bookmarks, source: :menu

  validates :name, presence: true
end
