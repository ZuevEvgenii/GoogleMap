ActiveAdmin.register User do
  index do
    column :email
    column :activated
    column :created_at
    default_actions
  end

  show do
    render "show"
  end

  form :partial => "form"
end

