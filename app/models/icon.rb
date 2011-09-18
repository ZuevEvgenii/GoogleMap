class Icon < ActiveRecord::Base
  has_many :markers, :dependent => :nullify
  mount_uploader :marker_icon, MarkerIconUploader
end

