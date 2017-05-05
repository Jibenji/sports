class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :profile
  has_one :session, through: :booking
end
