class Training < ApplicationRecord
  belongs_to :sport
  belongs_to :profile
  has_many :bookings


  def available_spots
    total = 0
    self.bookings.each do |booking|
      total += booking.participants
    end
    self.group_capacity - total
  end
end
