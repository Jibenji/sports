class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.boolean :admin, default: false
      t.integer :phone_number
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :country
      t.date :birth_date
      t.references :user, foreign_key: true
      t.references :trainer, foreign_key: true

      t.timestamps
    end
  end
end
