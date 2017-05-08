class Session < ApplicationRecord
  belongs_to :training

  has_one :sport, through: :training
  has_many :bookings
  has_many :reviews, through: :bookings

  def available_spots
    total = 0
    self.bookings.each do |booking|
      total += booking.participants
    end
    self.group_capacity - total
  end

  def average_reviews
    if self.reviews.empty?
      return nil
    else
      n = 0
      total = 0
      average = 0
      self.reviews.each do |review|
        n += 1
        total += review.rating.to_f
      end
      average = (total / n).to_f
      {
        number: n,
        average_score: average.to_f
      }
    end
  end
end
