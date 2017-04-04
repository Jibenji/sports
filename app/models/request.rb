class Request < ApplicationRecord
  belongs_to :profile
  mount_uploader :banner_picture, PhotoUploader

  validates :banner_picture, presence: true
  validates :description, presence: true
  validates :bio, presence: true
end
