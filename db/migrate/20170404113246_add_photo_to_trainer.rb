class AddPhotoToTrainer < ActiveRecord::Migration[5.0]
  def change
    add_column :trainers, :banner_picture, :string
  end
end
