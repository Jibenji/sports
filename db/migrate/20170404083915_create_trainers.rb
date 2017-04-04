class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :certificates
      t.string :education
      t.string :description
      t.string :bio

      t.timestamps
    end
  end
end
