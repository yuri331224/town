class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :towns
  has_many :towns, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_towns, through: :likes, source: :town
  has_many :towns, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  has_many :comments, dependent: :destroy

  def already_liked?(town)
    self.likes.exists?(town_id: town.id)
  end
end
