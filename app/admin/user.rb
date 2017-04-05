ActiveAdmin.register User do
  index do
    selectable_column
    column :email
    column :admin
    actions
  end

  form do |f|
    f.inputs "Email" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :email, :admin

end

