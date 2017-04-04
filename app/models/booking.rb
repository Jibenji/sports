class Booking < ApplicationRecord
  belongs_to :training
  belongs_to :profile
end
