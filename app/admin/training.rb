ActiveAdmin.register Training do
  index do
    selectable_column
    column :sport_id
    column :profile_id
    column :title
    column :date
    column :time
    column :duration
    column :price
    column :group_capacity
    column :level
    column :description
    actions
  end

  permit_params :title, :time, :duration, :price, :group_capacity, :level, :description,
  :outdoor, :longitude, :latitude, :country, :zip_code, :city, :address, :sport_id, :profile_id
end
