class RenameCountToToInWorldStatistic < ActiveRecord::Migration
  def self.up
    rename_column :world_statistics, :count, :to
  end

  def self.down
    rename_column :world_statistics, :to, :count
  end
end

