class RenamePercentageToFromInWorldStatistic < ActiveRecord::Migration
  def self.up
    rename_column :world_statistics, :percentage, :from
  end

  def self.down
    rename_column :world_statistics, :from, :percentage
  end
end

