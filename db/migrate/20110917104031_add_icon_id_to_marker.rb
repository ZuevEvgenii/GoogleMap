class AddIconIdToMarker < ActiveRecord::Migration
  def self.up
    add_column :markers, :icon_id, :integer
  end

  def self.down
    remove_column :markers, :icon_id
  end
end
