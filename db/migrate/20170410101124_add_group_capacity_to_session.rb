class AddGroupCapacityToSession < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :group_capacity, :integer
  end
end
