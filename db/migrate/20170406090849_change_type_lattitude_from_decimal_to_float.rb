class ChangeTypeLattitudeFromDecimalToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :trainings, :latitude, :float
  end
end
