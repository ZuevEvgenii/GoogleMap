class AddPublishedToMarkers < ActiveRecord::Migration
  def self.up
    add_column :markers, :published, :boolean, :default => true
  end

  def self.down
    remove_column :markers, :published
  end
end

