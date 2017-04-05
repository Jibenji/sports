class Profile < ApplicationRecord
  mount_uploader :photo_avatar, PhotoUploader

  belongs_to :user
  has_one :request
  has_one :trainer
  has_many :trainings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
end
