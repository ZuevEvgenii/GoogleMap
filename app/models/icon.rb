class Icon < ActiveRecord::Base
  has_many :markers, :dependent => :destroy
  mount_uploader :marker_icon, MarkerIconUploader
end

