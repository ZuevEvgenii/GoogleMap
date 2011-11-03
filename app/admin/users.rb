ActiveAdmin.register User do
  actions :all, :except => [:new]

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

