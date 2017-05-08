class Training < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  scope :cheap, -> { where("price < ?", 15).limit(2) }

  belongs_to :sport
  belongs_to :profile

  has_many :sessions, dependent: :destroy

  validates :sport, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :group_capacity, presence: true
  validates :level, presence: true
  validates :address, presence: true

  def average_reviews
    numerator = 0
    denominator = 0
    total = 0
    n = 0
    self.sessions.each do |session|
      unless session.average_reviews.nil?
        n += session.reviews.count
        numerator += session.average_reviews[:average_score] * session.average_reviews[:number]
        denominator += session.average_reviews[:number]
      end
    end
    if denominator != 0
      (total = numerator / denominator)
    else
      total = 0
    end
    {
      average_score: total,
      number: n
    }
  end
end
