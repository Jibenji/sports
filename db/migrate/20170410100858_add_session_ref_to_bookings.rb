class AddSessionRefToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :session, index: true
  end
end
