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
end
