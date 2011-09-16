class AddMarkerIconToMarkers < ActiveRecord::Migration
  def self.up
    add_column :markers, :marker_icon, :string
  end

  def self.down
    remove_column :markers, :marker_icon
  end
end
