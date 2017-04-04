class AddPhotoToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :avatar_picture, :string
  end
end
