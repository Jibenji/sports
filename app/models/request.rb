class Request < ApplicationRecord
  belongs_to :profile
  mount_uploader :banner_picture, PhotoUploader
end
