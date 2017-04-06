class ChangeTypeLongitudeFromDecimalToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :trainings, :longitude, :float
  end
end
