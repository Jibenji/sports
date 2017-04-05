class RemoveAdminFromProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :admin, :boolean
  end
end
