class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.string :title
      t.date :date
      t.time :time
      t.integer :duration
      t.integer :price
      t.integer :group_capacity
      t.string :level
      t.string :description
      t.boolean :outdoor
      t.decimal :longitude
      t.decimal :latitude
      t.string :country
      t.string :zip_code
      t.string :city
      t.string :address
      t.references :sport, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
