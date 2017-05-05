class Trainer < ApplicationRecord
  mount_uploader :banner_picture, PhotoUploader
  has_one :profile

  def average_reviews
    self.profile.trainings.sessions.reviews
  end
end
