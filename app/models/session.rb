class Session < ApplicationRecord
  belongs_to :training

  has_one :sport, through: :training
  has_many :bookings

  def available_spots
    total = 0
    self.bookings.each do |booking|
      total += booking.participants
    end
    self.group_capacity - total
  end
end
