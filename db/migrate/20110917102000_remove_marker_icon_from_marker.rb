class RemoveMarkerIconFromMarker < ActiveRecord::Migration
  def self.up
    remove_column :markers, :marker_icon
  end

  def self.down
    add_column :markers, :marker_icon, :string
  end
end
