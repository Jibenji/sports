class Booking < ApplicationRecord
  belongs_to :session
  belongs_to :profile
  has_one :review
end
