class Training < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :sport
  belongs_to :profile
  has_many :bookings
  validates :sport, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :group_capacity, presence: true
  validates :level, presence: true
  validates :address, presence: true

  def available_spots
    total = 0
    self.bookings.each do |booking|
      total += booking.participants
    end
    self.group_capacity - total
  end
end
