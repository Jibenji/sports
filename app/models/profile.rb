class Profile < ApplicationRecord
  mount_uploader :avatar_picture, PhotoUploader

  belongs_to :user
  has_one :request
  belongs_to :trainer, optional: true
  has_many :trainings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # has_many :messages, dependent: :destroy

  def average_reviews
    numerator = 0
    denominator = 0
    total = 0
    n = 0
    self.trainings.each do |training|
      unless training.average_reviews.nil?
        n += training.average_reviews[:number]
        numerator += training.average_reviews[:average_score] * training.average_reviews[:number]
        denominator += training.average_reviews[:number]
      end
    end
    if denominator != 0
      (total = numerator / denominator)
      total
    else
      "No reviews"
    end
  end
end
