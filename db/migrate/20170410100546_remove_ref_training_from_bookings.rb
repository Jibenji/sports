class RemoveRefTrainingFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :training_id
  end
end
