class Town < ApplicationRecord
    belongs_to :user, optional: true
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    mount_uploader :image, ImageUploader
end
