class Sport < ApplicationRecord
  has_many :trainings, dependent: :destroy
  mount_uploader :banner_sport_picture, PhotoUploader
end
