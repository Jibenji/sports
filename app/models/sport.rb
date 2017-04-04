class Sport < ApplicationRecord
  has_many :trainings, dependent: :destroy
  mount_uploader :banner_sport_picture, PhotoUploader
  validates :name, presence: true
  validates :tagline, presence: true
  validates :description, presence: true
  validates :banner_sport_picture, presence: true
end
