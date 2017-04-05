class Training < ApplicationRecord
  belongs_to :sport
  belongs_to :profile
  has_many :bookings
end

