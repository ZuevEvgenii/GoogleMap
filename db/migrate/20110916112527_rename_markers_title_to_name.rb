class RenameMarkersTitleToName < ActiveRecord::Migration
  def self.up
    rename_column :markers, :title, :name
  end

  def self.down
    rename_column :markers, :name, :title
  end
end

