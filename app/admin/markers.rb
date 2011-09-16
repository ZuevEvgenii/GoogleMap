ActiveAdmin.register Marker do
    form(:html => {:multipart => true}) do |f|
      f.inputs "Details" do
        f.input :group,  :as => :select,      :collection => Group.find(:all)
        f.input :name
        f.input :description
        f.input :address
        f.input :longitude
        f.input :latitude
        f.input :marker_icon, :as => :file
      end
      f.buttons
    end
end

