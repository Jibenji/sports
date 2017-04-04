class AddPhotoToSport < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :banner_sport_picture, :string
  end
end
