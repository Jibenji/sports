class AddPhotoToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :banner_picture, :string
  end
end
