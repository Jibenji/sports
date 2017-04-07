class Trainer < ApplicationRecord
  mount_uploader :banner_picture, PhotoUploader
  has_one :profile
end
