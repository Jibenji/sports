class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :certificates
      t.string :education
      t.string :description
      t.string :bio
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
