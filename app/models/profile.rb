class Profile < ApplicationRecord

  mount_uploader :avatar_picture, PhotoUploader

  belongs_to :user
  has_one :request
  belongs_to :trainer, optional: true
  has_many :trainings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
end
