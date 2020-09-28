class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_menus, through: :bookmarks, source: :menu

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :name, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create

  def self.guest
    find_by(email: 'test@condate.com') do |user|
      user.password = ENV['PASSWORD']
    end
  end
end
