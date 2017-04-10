class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.date :date
      t.time :time
      t.integer :duration
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end
