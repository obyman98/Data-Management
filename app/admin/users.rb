ActiveAdmin.register User do

  menu if: proc{ current_user.role == 'admin' }
  permit_params :email, :role, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :role, :collection => %w[admin member]
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
